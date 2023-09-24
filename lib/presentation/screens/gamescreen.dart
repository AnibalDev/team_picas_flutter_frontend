import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/presentation/components/playerview.dart';
import 'package:team_picas_flutter_frontend/presentation/components/player-games-vertical.dart';
import 'package:team_picas_flutter_frontend/presentation/components/player-games.dart';
import 'package:team_picas_flutter_frontend/presentation/components/playerhand.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  static List<String> playerHand = <String>['7c', '8d', '9p', '13t'];
  static List<List<String>> player1Games = <List<String>>[[]];
  static List<List<String>> player2Games = <List<String>>[
    [
      '1c',
      '2c',
      '3c',
    ],
    [
      '4c',
      '4t',
      '4p',
      '4d',
    ]
  ];
  static List<List<String>> player3Games = <List<String>>[[]];
  static List<List<String>> player4Games = <List<String>>[[]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Name'),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            //Background Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.lightBlue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 1]),
              ),
            ),
            //Background Image
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
              child: Image.asset(
                'assets/images/mesa-short.png',
                scale: 0.1,
                fit: BoxFit.fitWidth,
              ),
            ),

            Column(
              children: [
                PlayerView(
                  name: 'Jose Aleman',
                  ramainedCards: 0,
                ),
                PlayerGames(playerGames: player1Games),
                SizedBox(height: 40),
                Row(
                  children: [
                    PlayerView(
                      name: 'Heyling',
                      ramainedCards: 9,
                    ),
                    Spacer(),
                    PlayerView(
                      name: 'Odalys',
                      ramainedCards: 9,
                    ),
                  ],
                ),
                Row(
                  children: [
                    PlayerGamesVertical(playerGames: player2Games),
                    PlayerGamesVertical(
                      playerGames: player3Games,
                      orientation: MainAxisAlignment.end,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                PlayerGames(playerGames: player4Games),
                SizedBox(height: 8),
                PlayerView(
                  name: 'Anibal',
                  ramainedCards: 9,
                ),
                PlayerHand(playerHand: playerHand),
                SizedBox(
                  height: 30,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            )
          ],
        ),
      ),
    );
  }
}
