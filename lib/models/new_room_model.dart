import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class PrivateRoom {
  final String roomName;
  final String userName;
  const PrivateRoom({
    required this.roomName,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'roomName': roomName,
      'userName': userName,
    };
  }

  factory PrivateRoom.fromMap(Map<String, dynamic> map) {
    return PrivateRoom(
      roomName: map['roomName'],
      userName: map['userName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PrivateRoom.fromJson(String source) => PrivateRoom.fromMap(json.decode(source));

  @override
  String toString() => 'PrivateRoom(roomName: $roomName, userName: $userName)';
}