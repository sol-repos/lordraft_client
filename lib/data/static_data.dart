abstract class StaticData {
  final String nameRef;
  final String name;
  
  const StaticData({
    required this.nameRef,
    required this.name,
  });
}

abstract class StaticDataFactory {
  StaticData fromJson(Map<String, dynamic> json);
}