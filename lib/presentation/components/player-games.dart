import 'package:flutter/material.dart';

class PlayerGames extends StatefulWidget {
  const PlayerGames({super.key, required this.playerGames});

  final List<List<String>> playerGames;
  @override
  State<PlayerGames> createState() => _PlayerGameState();
}

class _PlayerGameState extends State<PlayerGames> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: widget.playerGames.map((e) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              child: Row(
                children: e.map((j) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.2, color: Colors.grey),
                      ),
                      child: Image.asset(
                        'assets/cards/${j}.png',
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }).toList()),
    );
  }
}
