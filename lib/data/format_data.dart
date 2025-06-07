import 'package:lordraft_client/data/remote_asset.dart';

class FormatData {
  final String nameRef;
  final String name;
  final RemoteAsset? icon;

  const FormatData({
    required this.nameRef,
    required this.name,
    required this.icon,
  });

  static FormatData fromJson(Map<String, dynamic> json) {
    final iconUrl = json['iconAbsolutePath'] as String?;
    return FormatData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
      icon: iconUrl == null ? null : RemoteAsset.fromDBUrl(iconUrl),
    );
  }
}