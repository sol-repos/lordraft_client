
import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'package:lordraft_client/presentation/states/game_session_state.dart';

class JoinGamePage extends StatefulWidget{
  final String sessionId;

  const JoinGamePage({super.key, required this.sessionId});

  @override
  State<JoinGamePage> createState() => _JoinGamePageState();
}

class _JoinGamePageState extends State<JoinGamePage> {
  @override
  void initState() {
    June.find<GameSessionState>().joinSession(widget.sessionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Joined LoR Cube Draft',
          style: TextTheme.of(context).headlineMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: JuneBuilder(
          () => June.find<GameSessionState>(),
          builder: (state) => state.status == GameSessionStatus.joined
              ? const Text('Successfully joined the game!', style: TextStyle(fontSize: 24))
              : const CircularProgressIndicator(),
          ),
      ),
    );
  }
}