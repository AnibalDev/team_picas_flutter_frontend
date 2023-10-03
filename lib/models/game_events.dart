import 'dart:convert';
import 'package:flutter/foundation.dart';

@immutable
abstract class GameUserEvent {
  const GameUserEvent();
}

enum GameUserEvents { left, joined }
