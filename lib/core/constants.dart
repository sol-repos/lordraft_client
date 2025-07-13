class Constants {
  static const _host = String.fromEnvironment('HOST', defaultValue: 'http://yeetforce.net');
  static const apiBaseUrl = '$_host:3000';
  static const ressourceBaseUrl = '$_host:3000/ressources';
  static const socketBaseUrl = '$_host:3001';
}