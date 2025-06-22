import 'package:collection/collection.dart';
import 'package:lordraft_client/data/format_data.dart';
import 'package:lordraft_client/data/keyword_data.dart';
import 'package:lordraft_client/data/rarity_data.dart';
import 'package:lordraft_client/data/region_data.dart';
import 'package:lordraft_client/data/set_data.dart';
import 'package:lordraft_client/data/spell_speed_data.dart';

class StaticDataManager {
  StaticDataManager._internal();
  static final StaticDataManager _instance = StaticDataManager._internal();
  factory StaticDataManager() => _instance;

  bool _initialized = false;

  late List<RegionData> regions;
  late List<KeywordData> keywords;
  late List<SpellSpeedData> spellSpeeds;
  late List<RarityData> rarities;
  late List<SetData> sets;
  late List<FormatData> formats;

  void initialize({
    required List<RegionData> regions,
    required List<KeywordData> keywords,
    required List<SpellSpeedData> spellSpeeds,
    required List<RarityData> rarities,
    required List<SetData> sets,
    required List<FormatData> formats,
  }) {
    if (_initialized) {
      throw Exception('StaticData is already initialized');
    }
    this.regions = regions;
    this.keywords = keywords;
    this.spellSpeeds = spellSpeeds;
    this.rarities = rarities;
    this.sets = sets;
    this.formats = formats;
    _initialized = true;
  }

  RegionData getRegionByRef(String regionRef) {
    if (!_initialized) {
      throw Exception('StaticData not initialized');
    }
    return regions.firstWhere((region) => region.nameRef == regionRef);
  }

  KeywordData getKeywordByRef(String keywordRef) {
    if (!_initialized) {
      throw Exception('StaticData not initialized');
    }
    return keywords.firstWhere((keyword) => keyword.nameRef == keywordRef);
  }

  SpellSpeedData? getSpellSpeedByRef(String spellSpeedRef) {
    if (!_initialized) {
      throw Exception('StaticData not initialized');
    }
    return spellSpeeds.firstWhereOrNull(
      (spellSpeed) => spellSpeed.nameRef == spellSpeedRef,
    );
  }

  RarityData getRarityByRef(String rarityRef) {
    if (!_initialized) {
      throw Exception('StaticData not initialized');
    }
    return rarities.firstWhere((rarity) => rarity.nameRef == rarityRef);
  }

  SetData getSetByRef(String setRef) {
    if (!_initialized) {
      throw Exception('StaticData not initialized');
    }
    return sets.firstWhere((set) => set.nameRef == setRef);
  }

  FormatData getFormatByRef(String formatRef) {
    if (!_initialized) {
      throw Exception('StaticData not initialized');
    }
    return formats.firstWhere((format) => format.nameRef == formatRef);
  }
}