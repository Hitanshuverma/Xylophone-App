import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Xylophone());
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: MainApp(),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  final player = AudioCache(prefix: 'assets/');
  Expanded tiles(int num, Color val) {

    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(val),
        ),
        onPressed: () {
          setState(
            () {
              player.play("note$num.wav");
            },
          );
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tiles(1, Colors.red),
        tiles(2, Colors.orange),
        tiles(3, Colors.yellow),
        tiles(4, Colors.green),
        tiles(5, Colors.blue),
        tiles(6, Colors.deepPurple),
        tiles(7, Colors.purple),
      ],
    );
  }
}
