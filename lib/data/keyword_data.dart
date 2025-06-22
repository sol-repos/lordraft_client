import 'package:lordraft_client/data/static_data.dart';

class KeywordData extends StaticData {
  final String description;

  const KeywordData({
    required super.nameRef,
    required super.name,
    required this.description,
  });
}

class KeywordDataFactory extends StaticDataFactory {
  @override
  KeywordData fromJson(Map<String, dynamic> json) {
    return KeywordData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}