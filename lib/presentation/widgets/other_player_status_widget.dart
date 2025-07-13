import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:lordraft_client/presentation/states/game_session_state.dart';

class OtherPlayerStatusWidget extends StatelessWidget {
  const OtherPlayerStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: JuneBuilder(
        () => June.find<GameSessionState>(),
        builder: (state) {
          switch (state.status) {
            case GameSessionStatus.connecting:
              return const Text('Loading...');
            case GameSessionStatus.ready:
              if (state.otherPlayerJoined) {
                return const Text('Other player joined ✓');
              } else {
                return SelectableText(state.sessionId!);
              }
            case GameSessionStatus.disconnected:
              return const Text('Disconnected from session');
          }
        },
      ),
    );
  }
}
