import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/models/game_user.dart';

class QueueRoomModel extends ChangeNotifier {
  List<GameUser> users = [];
  String roomName = "";

  void updateFromJson(Map<String, dynamic> json) {
    var userslist = json['players'] as List;
    users = userslist.map((e) => GameUser.fromJson(e)).toList();
    roomName = json['roomName'];
    notifyListeners();
  }

  QueueRoomModel({this.users = const <GameUser>[], this.roomName = ""}) {
    notifyListeners();
  }

  factory QueueRoomModel.fromJson(Map<String, dynamic> json) {
    var users = json['players'] as List;
    return QueueRoomModel(
      users: users.map((e) => GameUser.fromJson(e)).toList(),
      roomName: json['roomName'],
    );
  }
}
