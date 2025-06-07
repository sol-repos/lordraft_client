import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lordraft_client/core/constants.dart';
import 'package:lordraft_client/data/format_data.dart';
import 'package:lordraft_client/data/keyword_data.dart';
import 'package:lordraft_client/data/rarity_data.dart';
import 'package:lordraft_client/data/region_data.dart';
import 'package:lordraft_client/data/set_data.dart';
import 'package:lordraft_client/data/spell_speed_data.dart';

class Dependencies {
  static final Dependencies instance = Dependencies._internal();
  Dependencies._internal();

  final Map<String, dynamic> data = {
    'regions': [],
    'keywords': [],
    'spellSpeeds': [],
    'rarities': [],
    'sets': [],
    'formats': [],
  };

  Future<void> setupDependency(String key) async {
    final response = await http.get(Uri.parse('${Constants.apiBaseUrl}/$key'));
    if (response.statusCode != 200) {
      throw Exception('Failed to load $key');
    }
    data[key] = (jsonDecode(response.body))
        .map((itemJson) => switch (key) {
          'regions' => RegionData.fromJson(itemJson as Map<String, dynamic>),
          'keywords' => KeywordData.fromJson(itemJson as Map<String, dynamic>),
          'spellSpeeds' => SpellSpeedData.fromJson(itemJson as Map<String, dynamic>),
          'rarities' => RarityData.fromJson(itemJson as Map<String, dynamic>),
          'sets' => SetData.fromJson(itemJson as Map<String, dynamic>),
          'formats' => FormatData.fromJson(itemJson as Map<String, dynamic>),
          _ => throw Exception('Unknown key: $key'),
        })
        .toList();
  }

  Future<void> setup() async {
    for (final key in data.keys) {
      await setupDependency(key);
    }
  }

  dynamic getByRef(String key, String ref) {
    if (data.containsKey(key)) {
      return data[key].firstWhere(
        (item) => item.nameRef == ref,
        orElse: () => null,
      );
    } else {
      throw Exception('Dependency not found: $ref');
    }
  }
}

RegionData getRegion(String regionRef) => Dependencies.instance.getByRef('regions', regionRef) as RegionData;

KeywordData getKeyword(String keywordRef) => Dependencies.instance.getByRef('keywords', keywordRef) as KeywordData;

SpellSpeedData? getSpellSpeed(String spellSpeedRef) => Dependencies.instance.getByRef('spellSpeeds', spellSpeedRef) as SpellSpeedData?;

RarityData getRarity(String rarityRef) => Dependencies.instance.getByRef('rarities', rarityRef) as RarityData;

SetData getSet(String setRef) => Dependencies.instance.getByRef('sets', setRef) as SetData;

FormatData getFormat(String formatRef) => Dependencies.instance.getByRef('formats', formatRef) as FormatData;
