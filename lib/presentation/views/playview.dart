import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/controllers/socket_game_controller.dart';
import 'package:team_picas_flutter_frontend/models/new_room_model.dart';
import 'package:team_picas_flutter_frontend/presentation/views/colaview.dart';

class PlayView extends StatefulWidget {
  const PlayView({super.key});

  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      SocketGameController.get(context)
        ..init()
        ..connect(
          onConnectionError: (data) {
            print(data);
          },
        );
    });
    super.initState();
  }

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
              SocketGameController.get(context).joinServer('Mi Usuario 2',
                  onSubscribe: () {
                SocketGameController.get(context).joinPublicRoom();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => QueueView()));
                //Navigator.pushNamed(context, '/queue');
              });
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
            child: Center(child: Text('Por definir')),
            width: double.infinity,
            height: 300,
          ),
        ]),
      ),
    );
  }
}
