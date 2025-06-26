import 'package:june/june.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:lordraft_client/domain/lordraft_socket_service.dart';

enum GameSessionStatus {
  idle,
  startingHost,
  joining,
  hosting,
  joined,
}

class GameSessionState extends JuneState {
  GameSessionStatus status = GameSessionStatus.idle;
  String? sessionId;
  DeckData? deckData;

  final LordraftSocketService socketService;

  GameSessionState(this.socketService);

  void startHosting() async {
    status = GameSessionStatus.startingHost;
    setState();
    sessionId = await socketService.connectAndHost();
    status = GameSessionStatus.hosting;
    _setupGameSession();
    setState();
  }

  void joinSession(String sessionId) async {
    status = GameSessionStatus.joining;
    setState();
    await socketService.connectAndJoin(sessionId);
    status = GameSessionStatus.joined;
    _setupGameSession();
    setState();
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