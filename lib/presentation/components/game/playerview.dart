import 'package:flutter/material.dart';

class PlayerView extends StatefulWidget {
  const PlayerView(
      {super.key,
      required this.name,
      required this.ramainedCards,
      required this.imagePath});
  final String name;
  final int ramainedCards;
  final String imagePath;

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: Color.fromARGB(255, 8, 36, 53)),
          width: 120,
          height: 40,
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  widget.ramainedCards.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                  ),
                ),
                Text(
                  '1000xp',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ]),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 24,
          child: CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(widget.imagePath),
          ),
        ),
      ],
    );
  }
}
