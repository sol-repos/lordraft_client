import 'package:lordraft_client/data/remote_asset.dart';
import 'package:lordraft_client/data/static_data.dart';

class SetData extends StaticData {
  final RemoteAsset icon;

  const SetData({
    required super.nameRef,
    required super.name,
    required this.icon,
  });
}

class SetDataFactory extends StaticDataFactory {
  @override
  SetData fromJson(Map<String, dynamic> json) {
    return SetData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
      icon: RemoteAsset.fromDBUrl(json['iconAbsolutePath'] as String),
    );
  }
}