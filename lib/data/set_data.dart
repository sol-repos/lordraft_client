import 'package:lordraft_client/data/remote_asset.dart';

class SetData {
  final String nameRef;
  final String name;
  final RemoteAsset icon;

  const SetData({
    required this.nameRef,
    required this.name,
    required this.icon,
  });

  static SetData fromJson(Map<String, dynamic> json) {
    return SetData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
      icon: RemoteAsset.fromDBUrl(json['iconAbsolutePath'] as String),
    );
  }
}