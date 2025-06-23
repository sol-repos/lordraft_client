import 'package:lordraft_client/core/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';

class LordraftSocketService {
    Socket? _socket;
  

  void connect({void Function()? onConnect}) {
    _socket = io(
      Constants.socketBaseUrl,
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .setReconnectionAttempts(5)
          .setReconnectionDelay(500)
          .build(),
    );

    _socket!.onConnect((_) {
      onConnect?.call();
    });

    _socket!.onDisconnect((_) {
      // TODO: Handle disconnect
    });

    _socket!.onError((error) {
      // TODO: Handle error
    });
  }

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }

}