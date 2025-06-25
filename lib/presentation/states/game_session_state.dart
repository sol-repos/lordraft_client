import 'package:june/june.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:lordraft_client/domain/lorbase.dart';
import 'package:lordraft_client/domain/lordraft_socket_service.dart';

enum GameSessionStatus {
  idle,
  staringHost,
  joining,
  hosting,
  joined,
}

class GameSessionState extends JuneState {
  GameSessionStatus status = GameSessionStatus.idle;
  DeckData? deckData;

  final LordraftSocketService socketService;

  GameSessionState(this.socketService);

  void startHosting() {
    status = GameSessionStatus.staringHost;
    setState();
    socketService.connectAndHost(onHosted: () {
      status = GameSessionStatus.hosting;
      setState();
    });
  }

  void joinSession(String sessionId) {
    status = GameSessionStatus.joining;
    setState();
    socketService.connectAndJoin(sessionId, onJoined: () {
      status = GameSessionStatus.joined;
      setState();
    });
  }

  void submitDeckCodeInput(String deckCodeInput) async {
    final deckCode = deckCodeInput.replaceAll(' ', '');
    final data = await Lorbase.getDeckFromCode(deckCode);
    if (data != null) {
      deckData = data;
      setState();
    } else {
      // TODO: Handle error, e.g., show a dialog or a snackbar
    }
  }
}