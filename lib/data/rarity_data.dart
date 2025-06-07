class RarityData {
  final String nameRef;
  final String name;

  const RarityData({
    required this.nameRef,
    required this.name,
  });

  static RarityData fromJson(Map<String, dynamic> json) {
    return RarityData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
    );
  }
}