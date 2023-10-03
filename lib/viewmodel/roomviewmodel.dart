import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/models/roommodel.dart';

class RoomViewModel with ChangeNotifier {
  late GameRoomModel roomModel =
      GameRoomModel(playersList: [], actualPlayerIndex: 0, roomName: "Room");

  late String myId;

  String get roomName {
    return roomModel.roomName;
  }

  PlayerModel get myself {
    return roomModel.playersList.firstWhere((player) => player.id == myId);
  }

  List<CardModel> get myHand {
    return myself.playerHand;
  }

  List<PlayerModel> get rivals {
    return roomModel.playersList.where((player) => player.id != myId).toList();
  }
}
