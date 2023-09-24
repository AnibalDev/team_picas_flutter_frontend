import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key, required this.assetDir});
  final String assetDir;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  double selected = 6;
  double elevation = 2;
  Color color = Colors.black;
  changeColor() {
    elevation = elevation == 2 ? 4 : 2;
    selected = selected == 6 ? 0 : 6;
    color = color == Colors.black ? Colors.red : Colors.black;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.0, selected, 2.0, selected),
      child: GestureDetector(
        onTap: () {
          changeColor();
        },
        child: Card(
          child: Image.asset(
            widget.assetDir,
          ),
          shadowColor: color,
          elevation: elevation,
        ),
      ),
    );
  }
}
