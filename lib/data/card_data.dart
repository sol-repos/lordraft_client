import 'package:lordraft_client/data/associated_cards_data.dart';
import 'package:lordraft_client/data/card_description_data.dart';
import 'package:lordraft_client/data/format_data.dart';
import 'package:lordraft_client/data/keyword_data.dart';
import 'package:lordraft_client/data/rarity_data.dart';
import 'package:lordraft_client/data/region_data.dart';
import 'package:lordraft_client/data/remote_asset.dart';
import 'package:lordraft_client/data/set_data.dart';
import 'package:lordraft_client/data/spell_speed_data.dart';
import 'package:lordraft_client/core/dependencies.dart';

class CardData {
  final AssociatedCardsData associatedCards;
  final RemoteAsset gameImage;
  final RemoteAsset fullImage;
  final List<RegionData> regions;
  final int attack;
  final int cost;
  final int health;
  final CardDescriptionData description;
  final CardDescriptionData levelupDescription;
  final String flavorText;
  final String artistName;
  final String name;
  final String cardCode;
  final List<KeywordData> keywords;
  final SpellSpeedData? spellSpeed;
  final RarityData rarity;
  final List<String> subtypes;
  final String supertype;
  final String type;
  final bool isCollectible;
  final SetData containingSet;
  final List<FormatData> legalFormats;

  const CardData({
    required this.associatedCards,
    required this.gameImage,
    required this.fullImage,
    required this.regions,
    required this.attack,
    required this.cost,
    required this.health,
    required this.description,
    required this.levelupDescription,
    required this.flavorText,
    required this.artistName,
    required this.name,
    required this.cardCode,
    required this.keywords,
    required this.spellSpeed,
    required this.rarity,
    required this.subtypes,
    required this.supertype,
    required this.type,
    required this.isCollectible,
    required this.containingSet,
    required this.legalFormats,
  });

  static CardData fromJson(Map<String, dynamic> json) {
    return CardData(
      associatedCards: AssociatedCardsData(cardRefs: List<String>.from(json['associatedCardRefs'])),
      gameImage: RemoteAsset.fromDBUrl(json['gameAbsolutePath'] as String),
      fullImage: RemoteAsset.fromDBUrl(json['fullAbsolutePath'] as String),
      regions: (json['regionRefs'] as List)
          .map((regionRef) => getRegion(regionRef as String))
          .toList(),
      attack: json['attack'] as int,
      cost: json['cost'] as int,
      health: json['health'] as int,
      description: CardDescriptionData(
        styleText: json['description'] as String,
        rawText: json['descriptionRaw'] as String,
      ),
      levelupDescription: CardDescriptionData(
        styleText: json['levelupDescription'] as String,
        rawText: json['levelupDescriptionRaw'] as String,
      ),
      flavorText: json['flavorText'] as String,
      artistName: json['artistName'] as String,
      name: json['name'] as String,
      cardCode: json['cardCode'] as String,
      keywords: (json['keywordRefs'] as List)
          .map((keywordRef) => getKeyword(keywordRef as String))
          .toList(),
      spellSpeed: getSpellSpeed(json['spellSpeedRef'] as String),
      rarity: getRarity(json['rarityRef'] as String),
      subtypes: List<String>.from(json['subtypes']),
      supertype: json['supertype'] as String,
      type: json['type'] as String,
      isCollectible: json['collectible'] == 1,
      containingSet: getSet(json['setRef'] as String),
      legalFormats: (json['formatRefs'] as List)
          .map((formatRef) => getFormat(formatRef as String))
          .toList(),
    );
  }
}