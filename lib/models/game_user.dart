import 'package:team_picas_flutter_frontend/models/game_events.dart';

class GameUser extends GameUserEvent {
  final String userName;
  final String id;
  final GameUserEvents? userEvent;

  const GameUser({
    required this.userName,
    required this.id,
    this.userEvent = GameUserEvents.joined,
  });

  factory GameUser.fromJson(Map<String, dynamic> json,
      {GameUserEvents? gameUserEvent}) {
    return GameUser(
      userName: json['userName'],
      id: json['userId'],
      userEvent: gameUserEvent,
    );
  }
}
