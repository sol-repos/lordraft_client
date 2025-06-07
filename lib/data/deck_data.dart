import 'package:lordraft_client/data/card_data.dart';

class DeckData {
  final List<CardCopies> cardCopiesList;
  final int deckFormat;
  final int deckVersion;

  const DeckData({
    required this.cardCopiesList,
    required this.deckFormat,
    required this.deckVersion,
  });

  static DeckData fromJson(Map<String, dynamic> json) {
    return DeckData(
      cardCopiesList: (json['cards'] as List)
          .map((cardCopies) => CardCopies(
                card: CardData.fromJson(cardCopies['card']),
                amount: cardCopies['amount'] as int,
              ))
          .toList(),
      deckFormat: json['format'] as int,
      deckVersion: json['version'] as int,
    );
  }

  List<CardData> get cardList {
    final List<CardData> cards = [];
    for (final cardCopies in cardCopiesList) {
      for (int i = 0; i < cardCopies.amount; i++) {
        cards.add(cardCopies.card);
      }
    }
    return cards;
  }
}

class CardCopies {
  final CardData card;
  final int amount;

  const CardCopies({
    required this.card,
    required this.amount,
  });
}