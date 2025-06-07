import 'package:lordraft_client/data/remote_asset.dart';

class RegionData {
  final String nameRef;
  final String name;
  final String abbreviation;
  final RemoteAsset icon;

  const RegionData({
    required this.nameRef,
    required this.name,
    required this.abbreviation,
    required this.icon,
  });

  static RegionData fromJson(Map<String, dynamic> json) {
    return RegionData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
      abbreviation: json['abbreviation'] as String,
      icon: RemoteAsset.fromDBUrl(json['iconAbsolutePath'] as String),
    );
  }
}