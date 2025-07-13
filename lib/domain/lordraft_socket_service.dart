import 'dart:async';

import 'package:lordraft_client/core/constants.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:socket_io_client/socket_io_client.dart';

class LordraftSocketService {
  static LordraftSocketService? _instance;
  Socket? _socket;
  String? _currentSessionId;
  bool _isHost = false;

  static LordraftSocketService get instance {
    _instance ??= LordraftSocketService._internal();
    return _instance!;
  }

  LordraftSocketService._internal();

  Future<String> connectAndHost() async {
    // Check if already connected and hosting
    if (_socket != null && _socket!.connected && _isHost && _currentSessionId != null) {
      return _currentSessionId!;
    }

    disconnect();

    _socket = io(
      Constants.socketBaseUrl,
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .setReconnectionAttempts(5)
          .setReconnectionDelay(500)
          .build(),
    );

    final completer = Completer<String>();

    void handleHostSuccessful(sessionId) {
      if (!completer.isCompleted) {
        _currentSessionId = sessionId;
        _isHost = true;
        completer.complete(sessionId);
      }
      _socket!.off('hostSuccessful', handleHostSuccessful);
    }

    _socket!.onConnect((_) {
      _socket!.emit('host');
    });

    _socket!.on('hostSuccessful', handleHostSuccessful);

    _socket!.on('error', (error) {
      if (!completer.isCompleted) {
        completer.completeError(error ?? Exception('Unknown socket error'));
      }
    });

    _socket!.onDisconnect((_) {
      _currentSessionId = null;
      _isHost = false;
      if (!completer.isCompleted) {
        completer.completeError(Exception('Socket disconnected before hosting.'));
      }
    });

    _socket!.onError((error) {
      if (!completer.isCompleted) {
        completer.completeError(error ?? Exception('Unknown socket error'));
      }
    });

    return completer.future;
  }

  Future<void> connectAndJoin(String sessionId) async {
    // Check if already connected to the same session
    if (_socket != null && _socket!.connected && !_isHost && _currentSessionId == sessionId) {
      return;
    }

    disconnect();

    _socket = io(
      Constants.socketBaseUrl,
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .setReconnectionAttempts(5)
          .setReconnectionDelay(500)
          .build(),
    );

    final completer = Completer<void>();

    void handleJoinSuccessful(_) {
      _currentSessionId = sessionId;
      _isHost = false;
      completer.complete();
      _socket!.off('joinSuccessful', handleJoinSuccessful);
    }

    _socket!.onConnect((_) {
      print('Connected to session: $sessionId');
      _socket!.emit('join', sessionId);
    });

    _socket!.on('joinSuccessful', handleJoinSuccessful);

    _socket!.on('error', (error) {
      if (!completer.isCompleted) {
        completer.completeError(error ?? Exception('Unknown socket error'));
      }
    });

    _socket!.onDisconnect((_) {
      _currentSessionId = null;
      _isHost = false;
      if (!completer.isCompleted) {
        completer.completeError(Exception('Socket disconnected before joining.'));
      }
    });

    _socket!.onError((error) {
      if (!completer.isCompleted) {
        completer.completeError(error ?? Exception('Unknown socket error'));
      }
    });

    return completer.future;
  }

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
    _currentSessionId = null;
    _isHost = false;
  }

  // Utility methods for checking connection state
  bool get isConnected => _socket != null && _socket!.connected;
  bool get isHost => _isHost;
  String? get currentSessionId => _currentSessionId;

  // Method to check if we can reuse existing connection
  bool canReuseConnection({String? sessionId, bool? asHost}) {
    if (!isConnected) return false;
    
    if (asHost != null && asHost != _isHost) return false;
    
    if (sessionId != null && sessionId != _currentSessionId) return false;
    
    return true;
  }

  void onPlayerJoined(Function() callback) {
    if (_socket == null || !_socket!.connected) {
      throw Exception('Socket is not connected');
    }

    // Remove any existing listeners to prevent duplicates on hot reload
    _socket!.off('playerJoined');
    _socket!.on('playerJoined', (_) {
      callback.call();
    });
  }

  void submitCubeDeckCode(String deckCode) {
    if (_socket == null || !_socket!.connected) {
      throw Exception('Socket is not connected');
    }

    _socket!.emit('submitCubeDeckCode', deckCode);
  }

  void onDeckDataReceived(Function(DeckData) callback) {
    if (_socket == null || !_socket!.connected) {
      throw Exception('Socket is not connected');
    }

    // Remove any existing listeners to prevent duplicates on hot reload
    _socket!.off('cubeDeckUpdated');
    _socket!.on('cubeDeckUpdated', (data) {
      final deckData = DeckData.fromJson(data);
      callback.call(deckData);
    });
  }
}
