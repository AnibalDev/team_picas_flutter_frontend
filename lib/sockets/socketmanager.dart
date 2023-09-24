import 'package:socket_io_client/socket_io_client.dart' as IO;

class Sockets {
  static final Sockets _singleton = Sockets._internal();
  late IO.Socket _socket;
  factory Sockets() {
    return _singleton;
  }
  _connectSocket() {
    _socket.onConnect((data) => print('Coneccion Establecida'));
    _socket.onConnectError((data) => print('Connection Error: $data'));
    _socket.onDisconnect((data) => print('Server disconnection error'));
  }

  Sockets._internal() {
    _socket = IO.io(
        'http://localhost:8080',
        IO.OptionBuilder().setTransports(['websocket']).setQuery(
            {'username': 'Test Name'}).build());
    _connectSocket();
  }
}
