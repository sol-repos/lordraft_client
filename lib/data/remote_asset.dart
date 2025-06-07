import 'package:flutter/widgets.dart';
import 'package:lordraft_client/core/constants.dart';

class RemoteAsset {
  final String path;

  const RemoteAsset({required this.path});

  NetworkImage provide() {
    return NetworkImage(Constants.ressourceBaseUrl + path);
  }

  static RemoteAsset fromDBUrl(String dbUrl) {
    final match = RegExp(r'(http:\/\/[^\/]+)\/([^\/]+)\/([^\/]+)\/([^\/]+)(.+)').firstMatch(dbUrl);
    //final baseUrl = match.group(1)!;
    //final version = match.group(2)!;
    final setCode = match!.group(3)!;
    //final locale = match.group(4)!;
    final assetPath = match.group(5)!;

    return RemoteAsset(path: '/$setCode$assetPath');
  }
}