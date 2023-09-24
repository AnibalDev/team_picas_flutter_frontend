import 'package:flutter/material.dart';

class PlayView extends StatelessWidget {
  const PlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vamos a divertinos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Text(
            'Como desea jugar?',
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/queue');
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.grey),
              height: 130,
              child: Center(child: Text('Todos vs Todos')),
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.grey),
            height: 130,
            child: Center(child: Text('Partida Personalizada')),
            width: double.infinity,
          ),
          Text(
            'Por definir',
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.grey),
            child: Center(child: Text('Partida Personalizada')),
            width: double.infinity,
            height: 300,
          ),
        ]),
      ),
    );
  }
}
