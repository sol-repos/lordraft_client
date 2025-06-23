import 'package:june/june.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:lordraft_client/domain/lorbase.dart';
import 'package:lordraft_client/domain/lordraft_socket_service.dart';

class HostGameState extends JuneState {
  bool isHosting = false;
  DeckData? deckData;

  final LordraftSocketService socketService;

  HostGameState(this.socketService);

  void startHosting() {
    socketService.connect(onConnect: () {
      isHosting = true;
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