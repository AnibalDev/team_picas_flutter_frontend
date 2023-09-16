import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final IO.Socket _socket = IO.io('http://localhost:8080', IO.OptionBuilder().setTransports(['websocket']).build());
  _connectSocket() {
    _socket.onConnect((data) => print('Coneccion Establecida'));  
    _socket.onConnectError((data) => print('Connection Error: $data'));
    _socket.onDisconnect((data) => print('Server disconnection error'));
  }

  @override
  void initState() {
    super.initState();
    _connectSocket();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('data'), appBar: AppBar(title: Text('data'),),);
  }
}
