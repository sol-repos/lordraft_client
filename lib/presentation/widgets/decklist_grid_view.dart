import 'package:flutter/material.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:lordraft_client/presentation/widgets/card_widget.dart';

class DecklistGridView extends StatelessWidget {
  final DeckData? deck;
  final int? maxColumns;
  final double cardWidth;
  final double horizontalSpacing;
  final double verticalSpacing;

  const DecklistGridView({
    super.key,
    required this.deck,
    this.maxColumns = 10,
    this.cardWidth = 100.0,
    this.horizontalSpacing = 10.0,
    this.verticalSpacing = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        int columns = (availableWidth - horizontalSpacing) ~/ (cardWidth + horizontalSpacing);
        if (maxColumns != null) {
          columns = columns.clamp(1, maxColumns!);
        }
        final cards = deck?.cardList ?? [];
        final rows = (cards.length / columns).ceil();

        return SingleChildScrollView(
          child: Column(
            children: List.generate(
              rows,
              (rowIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(columns, (columnIndex) {
                  final index = rowIndex * columns + columnIndex;
                  if (index >= cards.length) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    padding: EdgeInsets.only(
                      left: horizontalSpacing/2,
                      right: horizontalSpacing/2,
                      top: verticalSpacing/2,
                      bottom: verticalSpacing/2,
                    ),
                    child: SizedBox(
                      width: cardWidth,
                      child: CardWidget(card: cards[index]),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
