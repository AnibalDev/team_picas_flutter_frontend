import 'package:flutter/material.dart';
import 'package:team_picas_flutter_frontend/presentation/views/homeview.dart';
import 'package:team_picas_flutter_frontend/presentation/views/playview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentViewIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentViewIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Color.fromARGB(20, 20, 27, 77),
        surfaceTintColor: Color.fromARGB(0, 255, 255, 255),
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        // Color del icono
        indicatorColor: Color.fromARGB(219, 218, 41, 0),
        selectedIndex: currentViewIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home),
            label: 'inicio',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            icon: Icon(Icons.play_arrow),
            label: 'Jugar',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.wallet,
              color: Colors.white,
            ),
            icon: Icon(Icons.wallet),
            label: 'Compras',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      body: <Widget>[
        HomeView(),
        PlayView(),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
      ][currentViewIndex],
    );
  }
}
