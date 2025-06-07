class KeywordData {
  final String nameRef;
  final String name;
  final String description;

  const KeywordData({
    required this.nameRef,
    required this.name,
    required this.description,
  });

  static KeywordData fromJson(Map<String, dynamic> json) {
    return KeywordData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}