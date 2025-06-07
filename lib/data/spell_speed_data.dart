class SpellSpeedData {
  final String nameRef;
  final String name;

  const SpellSpeedData({
    required this.nameRef,
    required this.name,
  });

  static SpellSpeedData fromJson(Map<String, dynamic> json) {
    return SpellSpeedData(
      nameRef: json['nameRef'] as String,
      name: json['name'] as String,
    );
  }
}