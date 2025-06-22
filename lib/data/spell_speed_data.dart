import 'package:lordraft_client/data/static_data.dart';

class SpellSpeedData extends StaticData {
  const SpellSpeedData({
    required super.nameRef,
    required super.name,
  });
}

class SpellSpeedDataFactory extends StaticDataFactory {
  @override
  SpellSpeedData fromJson(Map<String, dynamic> json) {
    return SpellSpeedData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
    );
  }
}