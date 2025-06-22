import 'package:lordraft_client/data/static_data.dart';

class RarityData extends StaticData {
  const RarityData({
    required super.nameRef,
    required super.name,
  });
}

class RarityDataFactory extends StaticDataFactory {
  RarityData fromJson(Map<String, dynamic> json) {
    return RarityData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
    );
  }
}