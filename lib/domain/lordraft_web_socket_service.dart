import 'dart:io';

import 'package:lordraft_client/core/constants.dart';

class LordraftWebSocketService {
  WebSocket? _socket;

  Future<void> connect() async {
    _socket = await WebSocket.connect(Constants.wsBaseUrl);
  }

  void disconnect() {
    _socket?.close();
  }

  WebSocket? get socket => _socket;
}