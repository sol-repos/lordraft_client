import 'package:flutter/material.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:lordraft_client/domain/lorbase.dart';
import 'package:lordraft_client/presentation/widgets/decklist_grid_view.dart';

class DeckCodePage extends StatefulWidget {
  const DeckCodePage({super.key});

  @override
  State<DeckCodePage> createState() => _DeckCodePageState();
}

class _DeckCodePageState extends State<DeckCodePage> {
  DeckData? deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Header(
            onDeckSubmitted: (deck) {
              setState(() {
                this.deck = deck;
              });
            },
          ),
          Expanded(child: DecklistGridView(deck: deck)),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final void Function(DeckData?) onDeckSubmitted;

  const _Header({required this.onDeckSubmitted});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Card(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter Deck Code:'),
            Container(
              padding: EdgeInsets.all(10),
              width: 250,
              child: TextField(controller: controller),
            ),
            ElevatedButton(
              onPressed: () {
                Lorbase.getDeckFromCode(controller.text).then((deck) {
                  onDeckSubmitted(deck);
                });
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
