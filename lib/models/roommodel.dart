import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/models/game_events.dart';

class GameRoomModel extends ChangeNotifier {
  List<PlayerModel> playersList;
  int actualPlayerIndex;
  String roomName;
  List<CardModel> gameDeek = [];
  List<CardModel> gameGraveyard = [];
  GameRoomModel._({
    required this.playersList,
    required this.actualPlayerIndex,
    required this.roomName,
  });
  GameRoomModel(
      {required this.playersList,
      required this.actualPlayerIndex,
      required this.roomName});

  void updateFromJson(Map<String, dynamic> json) {
    var gameModel = json['gameModel'];
    var userslist = gameModel['playersList'] as List;
    playersList =
        userslist.map<PlayerModel>((e) => PlayerModel.fromJson(e)).toList();
    roomName = gameModel['roomName'];
    actualPlayerIndex = gameModel['actualPlayerIndex'] as int;

    notifyListeners();
  }

  factory GameRoomModel.fromJson(Map<String, dynamic> json) {
    return GameRoomModel._(
      playersList: json['playersList'] as List<PlayerModel>,
      actualPlayerIndex: json['actualPlayerIndex'] as int,
      roomName: json['roomName'] as String,
    );
  }
}

class PlayerModel {
  final String playerName;
  final List<CardModel> playerHand;
  final List<List<CardModel>> playerGames;
  final String id;

  PlayerModel({
    required this.playerName,
    required this.playerHand,
    required this.id,
    required this.playerGames,
  });
  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    var games = json['playerGames'] as List;
    var hand = (json['playerHand'] as Map<String, dynamic>).values.first;
    return PlayerModel(
        playerGames: [],
        playerName: json['playerName'],
        id: json['playerId'],
        playerHand: hand.map<CardModel>((k) => CardModel.fromJson(k)).toList());
  }
}

class CardModel {
  String get id {
    return '$value$type';
  }

  int value;
  String type;
  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      value: json['value'] as int,
      type: json['type'],
    );
  }
  CardModel({required this.value, required this.type});
}

class HandModel {
  var hand = <CardModel>[];

  void removeCard(CardModel card) =>
      hand.removeWhere((item) => item.id == card.id);
  void addCard(CardModel card) => hand.add(card);
}
