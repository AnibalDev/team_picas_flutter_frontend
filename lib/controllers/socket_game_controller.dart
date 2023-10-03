import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:provider/provider.dart';
import 'package:team_picas_flutter_frontend/controllers/game_provider.dart';
import 'package:team_picas_flutter_frontend/models/queue_room.dart';
import 'package:team_picas_flutter_frontend/viewmodel/roomviewmodel.dart';

export 'package:provider/provider.dart';

class NotConnected implements Exception {}

class NotSubscribed implements Exception {}

const String kLocalhost = 'http://localhost:8080';

typedef DynamicCallback = void Function(dynamic data);

enum InputEvent {
  joined,
  startGame,
  newUserToGameRoom,
  userLeftChatRoom,
  updateGame,
}

enum OutputEvent {
  joinServer,
  joinPublicRoom,
  unsubscribe,
  newMessage,
}

String enumToString(enumName) {
  return enumName.toString().split(".").last;
}

class SocketGameController extends ChangeNotifier {
  GameProvider? _gameProvider;

  SocketGameController(this._gameProvider);

  static SocketGameController get(BuildContext context) =>
      context.read<SocketGameController>();
  Socket? _socket;
  bool get connected => _socket!.connected;
  bool get disConnected => !connected;

  void init({String? url}) {
    _socket ??= io(
      url ?? _localhost,
      OptionBuilder().setTransports(['websocket']).disableAutoConnect().build(),
    );
    //_newMessagesController ??= StreamController<List<ChatEvent>>.broadcast();
    //_events = [];
  }

  void _initListeners() {
    _connectedAssetion();
    final _socket = this._socket!;
    _socket.on(enumToString(InputEvent.joined), (data) {
      _gameProvider!.updateQueueFromJson(data);
    });
    _socket.on(enumToString(InputEvent.startGame), (data) {
      _gameProvider!.updateGameFromJson(data);
      _gameProvider!.startGame();
    });
  }

  void joinServer(String name, {VoidCallback? onSubscribe}) {
    _connectedAssetion();
    final _socket = this._socket!;
    _socket.emit(
      enumToString(OutputEvent.joinServer),
      name,
    );
    onSubscribe?.call();
  }

  void joinPublicRoom({VoidCallback? onJoin}) {
    _connectedAssetion();
    final _socket = this._socket!;
    _socket.emit(enumToString(OutputEvent.joinPublicRoom));
    onJoin?.call();
    _gameProvider!.myId = _socket.id!;
  }

  Socket connect(
      {DynamicCallback? onConnectionError, VoidCallback? connected}) {
    final _socketS = _socket!.connect();

    _socket!.onConnect((_) {
      _initListeners();
      connected?.call();
      log("Connected to Socket");
    });

    _socket!.onConnectError((data) => onConnectionError?.call(data));
    return _socketS;
  }

  Socket disconnect({VoidCallback? disconnected}) {
    final _socketS = _socket!.disconnect();
    _socket!.onDisconnect((_) {
      disconnected?.call();
      log("Disconnected");
    });
    return _socketS;
  }

  void _connectedAssetion() {
    if (disConnected) throw NotConnected();
  }

  String get _localhost {
    final _uri = Uri.parse(kLocalhost);

    if (Platform.isIOS) return kLocalhost;

    //Android local url
    return '${_uri.scheme}://10.0.2.2:${_uri.port}';
  }
}
