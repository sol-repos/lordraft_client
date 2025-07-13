import 'package:june/june.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:lordraft_client/domain/lordraft_socket_service.dart';

enum GameSessionStatus {
  disconnected,
  connecting,
  ready,
}

class GameSessionState extends JuneState {
  GameSessionStatus status = GameSessionStatus.disconnected;
  bool? isHost;
  String? sessionId;
  DeckData? deckData;
  bool otherPlayerJoined = false;

  // Use singleton instance
  LordraftSocketService get socketService => LordraftSocketService.instance;

  GameSessionState() {
    // Check if we already have an active connection on startup/hot reload
    _initializeConnectionState();
  }

  void _initializeConnectionState() {
    if (socketService.isConnected) {
      status = GameSessionStatus.ready;
      isHost = socketService.isHost;
      sessionId = socketService.currentSessionId;
      
      // Re-setup listeners in case of hot reload
      if (isHost == true) {
        _listenForJoin();
      } else {
        otherPlayerJoined = true;
      }
      _setupGameSession();
      setState();
    }
  }

  void startHosting() async {
    // Check if already hosting the same session
    if (socketService.canReuseConnection(asHost: true)) {
      isHost = true;
      status = GameSessionStatus.ready;
      sessionId = socketService.currentSessionId;
      _listenForJoin();
      _setupGameSession();
      setState();
      return;
    }

    isHost = true;
    status = GameSessionStatus.connecting;
    setState();
    sessionId = await socketService.connectAndHost();
    status = GameSessionStatus.ready;
    _listenForJoin();
    _setupGameSession();
    setState();
  }

  void joinSession(String targetSessionId) async {
    // Check if already connected to the same session
    if (socketService.canReuseConnection(sessionId: targetSessionId, asHost: false)) {
      isHost = false;
      status = GameSessionStatus.ready;
      sessionId = targetSessionId;
      otherPlayerJoined = true;
      _setupGameSession();
      setState();
      return;
    }

    isHost = false;
    status = GameSessionStatus.connecting;
    setState();
    await socketService.connectAndJoin(targetSessionId);
    sessionId = targetSessionId;
    status = GameSessionStatus.ready;
    otherPlayerJoined = true;
    _setupGameSession();
    setState();
  }

  void _listenForJoin() {
    socketService.onPlayerJoined(() {
      otherPlayerJoined = true;
      setState();
    });
  }

  void _setupGameSession() {
    socketService.onDeckDataReceived((DeckData data) {
      deckData = data;
      setState();
    });
  }

  void submitDeckCodeInput(String deckCodeInput) async {
    final deckCode = deckCodeInput.replaceAll(' ', '');
    socketService.submitCubeDeckCode(deckCode);
  }

  void disconnect() {
    socketService.disconnect();
    status = GameSessionStatus.disconnected;
    isHost = null;
    sessionId = null;
    deckData = null;
    otherPlayerJoined = false;
    setState();
  }
}