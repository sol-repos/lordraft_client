import 'package:lordraft_client/data/remote_asset.dart';
import 'package:lordraft_client/data/static_data.dart';

class RegionData extends StaticData {
  final String abbreviation;
  final RemoteAsset icon;

  const RegionData({
    required super.nameRef,
    required super.name,
    required this.abbreviation,
    required this.icon,
  });
}

class RegionDataFactory extends StaticDataFactory {
  @override
  RegionData fromJson(Map<String, dynamic> json) {
    return RegionData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
      abbreviation: json['abbreviation'] as String,
      icon: RemoteAsset.fromDBUrl(json['iconAbsolutePath'] as String),
    );
  }
}