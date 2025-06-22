import 'package:lordraft_client/data/remote_asset.dart';
import 'package:lordraft_client/data/static_data.dart';

class FormatData extends StaticData {
  final RemoteAsset? icon;

  const FormatData({
    required super.nameRef,
    required super.name,
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

class FormatDataFactory extends StaticDataFactory {
  @override
  FormatData fromJson(Map<String, dynamic> json) {
    final iconUrl = json['iconAbsolutePath'] as String?;
    return FormatData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
      icon: iconUrl == null ? null : RemoteAsset.fromDBUrl(iconUrl),
    );
  }
}