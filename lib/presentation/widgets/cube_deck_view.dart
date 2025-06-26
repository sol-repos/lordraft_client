import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:lordraft_client/presentation/states/game_session_state.dart';
import 'package:lordraft_client/presentation/widgets/decklist_grid_view.dart';

class CubeDeckView extends StatelessWidget {
  const CubeDeckView({super.key});

  @override
  Widget build(BuildContext context) {
    return JuneBuilder(
      () => June.find<GameSessionState>(),
      builder: (state) {
        if (state.deckData == null) {
          return const SizedBox.shrink();
        }
        return DecklistGridView(deck: state.deckData);
      },
    );
  }
}
