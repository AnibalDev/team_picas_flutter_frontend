import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/main.dart';
import 'package:team_picas_flutter_frontend/models/queue_room.dart';
import 'package:team_picas_flutter_frontend/models/roommodel.dart';
import 'package:team_picas_flutter_frontend/viewmodel/roomviewmodel.dart';

class GameProvider extends ChangeNotifier {
  var queueRoom = QueueRoomModel();
  var gameRoom = RoomViewModel();
  late String myId;
  void updateGameFromJson(Map<String, dynamic> json) {
    gameRoom.roomModel.updateFromJson(json);
    gameRoom.myId = myId;
    notifyListeners();
  }
  void updateQueueFromJson(Map<String, dynamic> json) {
    queueRoom.updateFromJson(json);
    notifyListeners();
  }

  void startGame() {
    navigatorKey.currentState?.pushNamed('/game');
  }
}
