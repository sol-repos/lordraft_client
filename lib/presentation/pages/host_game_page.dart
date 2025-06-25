import 'package:flutter/material.dart';
import 'package:june/instance_manager.dart';
import 'package:june/state_manager/src/simple/state.dart';
import 'package:lordraft_client/presentation/states/game_session_state.dart';
import 'package:lordraft_client/presentation/widgets/decklist_grid_view.dart';
import 'package:lordraft_client/presentation/widgets/other_player_status_widget.dart';

class HostGamePage extends StatefulWidget {
  const HostGamePage({super.key});

  @override
  State<HostGamePage> createState() => _HostGamePageState();
}

class _HostGamePageState extends State<HostGamePage> {
  @override
  void initState() {
    June.find<GameSessionState>().startHosting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hosting LoR Cube Draft',
          style: TextTheme.of(context).headlineMedium,
        ),
        actions: [OtherPlayerStatusWidget()],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: JuneBuilder(
        () => June.find<GameSessionState>(),
        builder: (state) => state.status == GameSessionStatus.hosting
            ? const SingleChildScrollView(
                child: Column(children: [_DeckCodeEntry(), _CubeDeckView()]),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _DeckCodeEntry extends StatelessWidget {
  const _DeckCodeEntry();

  void _handleSubmit(String input) {
    June.find<GameSessionState>().submitDeckCodeInput(input);
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted: _handleSubmit,
              decoration: InputDecoration(
                labelText: 'Enter deck code containing the cards to draft',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => _handleSubmit(controller.text),
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class _CubeDeckView extends StatelessWidget {
  const _CubeDeckView();

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
