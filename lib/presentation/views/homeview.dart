import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const List<String> entries = <String>['A', 'B', 'C'];
  static const List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.abc),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            hoverColor: Color.fromARGB(162, 20, 27, 77),
            icon: Icon(Icons.home),
            onPressed: () {},
          )
        ],
        title: Column(
          children: [
            Text('Hola, Jugador'),
            Text(
              'Listo para jugar?',
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Promociones',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[colorCodes[index]],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 50,
                      width: 250,
                      child: Center(child: Text('Entry ${entries[index]}')),
                    ),
                  );
                }),
          ),
          Text(
            'Categorias',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[colorCodes[index]],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      width: 142,
                      child: Center(child: Text('Entry ${entries[index]}')),
                    ),
                  );
                }),
          ),
          Spacer(),
          Text(
            'Juega ahora',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber[colorCodes[index]],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 50,
                      width: 250,
                      child: Center(child: Text('Entry ${entries[index]}')),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
