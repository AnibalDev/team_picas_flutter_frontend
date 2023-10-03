import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_picas_flutter_frontend/controllers/game_provider.dart';
import 'package:team_picas_flutter_frontend/models/roommodel.dart';
import 'package:team_picas_flutter_frontend/presentation/components/game/playerview.dart';
import 'package:team_picas_flutter_frontend/presentation/components/game/player-games-vertical.dart';
import 'package:team_picas_flutter_frontend/presentation/components/game/player-games.dart';
import 'package:team_picas_flutter_frontend/presentation/components/game/playerhand.dart';
import 'package:team_picas_flutter_frontend/viewmodel/roomviewmodel.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late RoomViewModel vm;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vm = context.watch<GameProvider>().gameRoom;
    return Scaffold(
      appBar: AppBar(
        title: Text(vm.roomName),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            //Background Gradient
            Container(
              decoration: const BoxDecoration(
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
                  name: vm.rivals[0].playerName,
                  ramainedCards: vm.rivals[0].playerHand.length,
                  imagePath: 'assets/images/jose-aleman.png',
                ),
                PlayerGames(playerGames: vm.rivals[0].playerGames),
                SizedBox(height: 40),
                Row(
                  children: [
                    PlayerView(
                      name: vm.rivals[1].playerName,
                      ramainedCards: vm.rivals[1].playerHand.length,
                      imagePath: 'assets/images/heyling.png',
                    ),
                    Spacer(),
                    PlayerView(
                      name: vm.rivals[2].playerName,
                      ramainedCards: vm.rivals[2].playerHand.length,
                      imagePath: 'assets/images/odalys.png',
                    ),
                  ],
                ),
                Row(
                  children: [
                    PlayerGamesVertical(playerGames: vm.rivals[1].playerGames),
                    PlayerGamesVertical(
                      playerGames: vm.rivals[2].playerGames,
                      orientation: MainAxisAlignment.end,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                PlayerGames(playerGames: vm.myself.playerGames),
                SizedBox(height: 8),
                PlayerView(
                  name: vm.myself.playerName,
                  ramainedCards: vm.myHand.length,
                  imagePath: 'assets/images/mayrel.png',
                ),
                PlayerHand(playerHand: vm.myHand),
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
