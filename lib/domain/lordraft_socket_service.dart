import 'dart:async';

import 'package:lordraft_client/core/constants.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:socket_io_client/socket_io_client.dart';

class LordraftSocketService {
  Socket? _socket;

  Future<String> connectAndHost() async {
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
  }

  void onPlayerJoined(Function() callback) {
    if (_socket == null || !_socket!.connected) {
      throw Exception('Socket is not connected');
    }

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

    _socket!.on('cubeDeckUpdated', (data) {
      final deckData = DeckData.fromJson(data);
      callback.call(deckData);
    });
  }
}
