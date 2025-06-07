import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lordraft_client/core/constants.dart';
import 'package:lordraft_client/data/deck_data.dart';

class Lorbase {
  static Future<DeckData?> getDeckFromCode(String code) async {
    final response = await http.get(Uri.parse('${Constants.apiBaseUrl}/deckCode/$code'));
    if (response.statusCode != 200) {
      return null;
    }
    return DeckData.fromJson(jsonDecode(response.body));
  }
}