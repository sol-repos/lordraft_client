import 'package:lordraft_client/core/constants.dart';
import 'package:socket_io_client/socket_io_client.dart';

class LordraftSocketService {
    Socket? _socket;
  

  void connectAndHost({void Function()? onHosted}) {
    _socket = io(
      Constants.socketBaseUrl,
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .setReconnectionAttempts(5)
          .setReconnectionDelay(500)
          .build(),
    );

    _socket!.onConnect((_) {
      _socket!.emit('host');
    });

    _socket!.on('hostSuccessful', (_) {
      onHosted?.call();
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