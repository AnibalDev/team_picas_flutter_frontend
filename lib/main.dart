import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:team_picas_flutter_frontend/presentation/screens/gamescreen.dart';
import 'package:team_picas_flutter_frontend/presentation/screens/homescreen.dart';
import 'package:team_picas_flutter_frontend/presentation/screens/loginscreen.dart';
import 'package:team_picas_flutter_frontend/presentation/views/colaview.dart';
import 'package:team_picas_flutter_frontend/sockets/socketmanager.dart';

void main() {
  Sockets();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desmoche: Baraja Pinolera',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(204, 218, 41, 28)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/game': (context) => GameScreen(),
        '/queue': (context) => QueueView(),
      },
    );
  }
}
