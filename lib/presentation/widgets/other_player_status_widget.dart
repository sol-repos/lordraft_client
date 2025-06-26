import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:june/state_manager/state_manager.dart';
import 'package:lordraft_client/presentation/states/game_session_state.dart';

class OtherPlayerStatusWidget extends StatelessWidget {
  const OtherPlayerStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: JuneBuilder(
        () => June.find<GameSessionState>(),
        builder: (state) => Text(state.sessionId ?? 'Loading...'),
      ),
    );
  }
}
