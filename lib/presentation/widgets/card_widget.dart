import 'package:flutter/material.dart';
import 'package:lordraft_client/data/card_data.dart';

class CardWidget extends StatefulWidget {
  final CardData? card;

  const CardWidget({
    super.key,
    required this.card,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.card == null) {
      return const SizedBox.shrink();
    }
    return Image(image: widget.card!.gameImage.provide());
  }
}