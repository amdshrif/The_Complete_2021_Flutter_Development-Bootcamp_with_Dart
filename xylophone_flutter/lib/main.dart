import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  XylophoneApp({Key? key}) : super(key: key);

  final List sounds = [
    {'id': 1, 'color': Colors.red.shade100, 'soundName': 'note1.wave'},
    {'id': 2, 'color': Colors.red.shade200, 'soundName': 'note2.wave'},
    {'id': 3, 'color': Colors.red.shade300, 'soundName': 'note3.wave'},
    {'id': 4, 'color': Colors.red.shade400, 'soundName': 'note4.wave'},
    {'id': 5, 'color': Colors.red.shade500, 'soundName': 'note5.wave'},
    {'id': 6, 'color': Colors.red.shade600, 'soundName': 'note6.wave'},
    {'id': 7, 'color': Colors.red.shade700, 'soundName': 'note7.wave'},
  ];

  void playSound(String path) {
    final player = AudioPlayer();
    player.play(AssetSource(path));
  }

  Expanded buildKey(String path, Color color) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(path);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                sounds.length,
                (index) => buildKey(sounds[index]['soundName'], sounds[index]['color'],),
              ),
            )),
      ),
    );
  }
}
