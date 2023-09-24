import 'package:flutter/material.dart';

class PlayerGamesVertical extends StatefulWidget {
  const PlayerGamesVertical(
      {super.key,
      required this.playerGames,
      this.orientation = MainAxisAlignment.start});
  final MainAxisAlignment orientation;
  final List<List<String>> playerGames;
  @override
  State<PlayerGamesVertical> createState() => _PlayerGamesVerticalState();
}

class _PlayerGamesVerticalState extends State<PlayerGamesVertical> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 190,
        child: ListView(
            scrollDirection: Axis.vertical,
            children: widget.playerGames.map((e) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                child: Row(
                  mainAxisAlignment: widget.orientation,
                  children: e.map((j) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: Container(
                        width: 30,
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
      ),
    );
  }
}
