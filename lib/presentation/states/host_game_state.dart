import 'package:june/june.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:lordraft_client/domain/lorbase.dart';

class HostGameState extends JuneState {
  DeckData? deckData;

  void submitDeckCodeInput(String deckCodeInput) async {
    final deckCode = deckCodeInput.replaceAll(' ', '');
    final data = await Lorbase.getDeckFromCode(deckCode);
    if (data != null) {
      deckData = data;
      setState();
    } else {
      // Handle error, e.g., show a dialog or a snackbar
    }
  }
}