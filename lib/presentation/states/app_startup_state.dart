import 'package:june/june.dart';
import 'package:lordraft_client/core/static_data_manager.dart';
import 'package:lordraft_client/data/format_data.dart';
import 'package:lordraft_client/data/keyword_data.dart';
import 'package:lordraft_client/data/rarity_data.dart';
import 'package:lordraft_client/data/region_data.dart';
import 'package:lordraft_client/data/set_data.dart';
import 'package:lordraft_client/data/spell_speed_data.dart';
import 'package:lordraft_client/domain/lorbase.dart';
import 'package:lordraft_client/domain/lordraft_web_socket_service.dart';
import 'package:lordraft_client/presentation/states/host_game_state.dart';

class AppStartupState extends JuneState {
  bool isSetupDone = false;

  Future<void> setup() async {
    final regions = await Lorbase.getStaticData<RegionData>('regions', RegionDataFactory());
    final keywords = await Lorbase.getStaticData<KeywordData>('keywords', KeywordDataFactory());
    final spellSpeeds = await Lorbase.getStaticData<SpellSpeedData>('spellSpeeds', SpellSpeedDataFactory());
    final rarities = await Lorbase.getStaticData<RarityData>('rarities', RarityDataFactory());
    final sets = await Lorbase.getStaticData<SetData>('sets', SetDataFactory());
    final formats = await Lorbase.getStaticData<FormatData>('formats', FormatDataFactory());

    StaticDataManager().initialize(regions: regions, keywords: keywords, spellSpeeds: spellSpeeds, rarities: rarities, sets: sets, formats: formats);

    June.put(() => HostGameState(LordraftWebSocketService()));

    isSetupDone = true;
    setState();
  }
}
