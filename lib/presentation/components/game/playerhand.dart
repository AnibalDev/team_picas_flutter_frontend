import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/models/roommodel.dart';
import 'package:team_picas_flutter_frontend/presentation/components/game/my-card.dart';

class PlayerHand extends StatefulWidget {
  const PlayerHand({super.key, required this.playerHand});

  final List<CardModel> playerHand;

  @override
  State<PlayerHand> createState() => _PlayerHandState();
}

class _PlayerHandState extends State<PlayerHand> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.playerHand.length,
          itemBuilder: (BuildContext context, int index) {
            return MyCard(
                assetDir:
                    'assets/cards/${widget.playerHand.elementAt(index).id}.png');
          }),
    );
  }
}
