import 'dart:math';

import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/controllers/game_provider.dart';
import 'package:team_picas_flutter_frontend/controllers/socket_game_controller.dart';
import 'package:team_picas_flutter_frontend/models/queue_room.dart';

class QueueView extends StatefulWidget {
  const QueueView({super.key});

  @override
  State<QueueView> createState() => _QueueViewState();
}

class _QueueViewState extends State<QueueView> {
  //late String? roomNumber = _socketGameController!.roomName;
  List<String> players = [];

  SocketGameController? _socketGameController;

  updateState() {
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _socketGameController = SocketGameController.get(context);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sala N# ${context.watch<GameProvider>().queueRoom.roomName}'),
            Column(
              children: context.watch<GameProvider>().queueRoom.users.map((e) {
                return Text(e.userName);
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                _socketGameController;
                print('a');
              },
              child: Text('Button'),
            )
            /*
            SizedBox(
              child: ListView(children: widget.players.map((e) {
                return Text('');
              }),),
            )
            */
          ],
        ),
      ),
    );
  }
}
