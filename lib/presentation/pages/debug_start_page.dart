import 'package:flutter/material.dart';
import 'package:lordraft_client/presentation/pages/host_game_page.dart';
import 'package:lordraft_client/presentation/pages/join_game_page.dart';

class DebugStartPage extends StatefulWidget {
  const DebugStartPage({Key? key}) : super(key: key);

  @override
  State<DebugStartPage> createState() => _DebugStartPageState();
}

class _DebugStartPageState extends State<DebugStartPage> {
  final TextEditingController _joinController = TextEditingController();

  @override
  void dispose() {
    _joinController.dispose();
    super.dispose();
  }

  void _hostGame() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HostGamePage()));
  }

  void _joinGame() {
    final code = _joinController.text.trim();
    Navigator.push(context, MaterialPageRoute(builder: (context) => JoinGamePage(sessionId: code)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Start Page')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _hostGame,
              child: const Text('Host'),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _joinController,
              decoration: const InputDecoration(
                labelText: 'Enter code to join',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _joinGame,
              child: const Text('Join'),
            ),
          ],
        ),
      ),
    );
  }
}