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

  final LordraftSocketService socketService;

  GameSessionState(this.socketService);

  void startHosting() async {
    isHost = true;
    status = GameSessionStatus.connecting;
    setState();
    sessionId = await socketService.connectAndHost();
    status = GameSessionStatus.ready;
    _listenForJoin();
    _setupGameSession();
    setState();
  }

  void joinSession(String sessionId) async {
    isHost = false;
    status = GameSessionStatus.connecting;
    setState();
    await socketService.connectAndJoin(sessionId);
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
}