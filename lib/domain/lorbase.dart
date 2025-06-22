import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lordraft_client/core/constants.dart';
import 'package:lordraft_client/data/deck_data.dart';
import 'package:lordraft_client/data/static_data.dart';

class Lorbase {
  static Future<List<T>> getStaticData<T extends StaticData>(String remoteKey, StaticDataFactory factoryInstance) async {
    final response = await http.get(Uri.parse('${Constants.apiBaseUrl}/$remoteKey'));
    if (response.statusCode != 200) {
      throw Exception('Failed to get remote static data: $remoteKey');
    }

    final List<dynamic> jsonData = jsonDecode(response.body);

    return jsonData
        .map((json) => factoryInstance.fromJson(json) as T)
        .toList();
  }

  static Future<DeckData?> getDeckFromCode(String code) async {
    final response = await http.get(Uri.parse('${Constants.apiBaseUrl}/deckCode/$code'));
    if (response.statusCode != 200) {
      return null;
    }
    return DeckData.fromJson(jsonDecode(response.body));
  }
}