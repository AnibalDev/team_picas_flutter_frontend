import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/controllers/game_provider.dart';
import 'package:team_picas_flutter_frontend/controllers/socket_game_controller.dart';
import 'package:team_picas_flutter_frontend/presentation/screens/gamescreen.dart';
import 'package:team_picas_flutter_frontend/presentation/screens/homescreen.dart';
import 'package:team_picas_flutter_frontend/presentation/screens/loginscreen.dart';
import 'package:team_picas_flutter_frontend/presentation/views/colaview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  //Sockets(); 
  // //initializeApp();
  runApp(const MyApp());
}

Future<void> initializeApp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProxyProvider<GameProvider, SocketGameController>(
            create: (BuildContext context) => SocketGameController(null),
            update: (context, game, previus) => SocketGameController(game))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Desmoche: Baraja Pinolera',
        navigatorKey: navigatorKey,
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
      ),
    );
  }
}

// ...

