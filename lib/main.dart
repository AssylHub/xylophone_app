import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: XylophoneApp()
      ),
  ));
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    void soundPlayer(int soundNum) async {
      final player = AudioPlayer();
      await player.play(AssetSource('note$soundNum.wav'));
    }

    Expanded buildKey({required Color color, required int soundNum }) {
      return Expanded(
          child: TextButton(
              onPressed: () {
                soundPlayer(soundNum);
                print("$color");
              },
              style: TextButton.styleFrom(
                
                backgroundColor: color,
                enableFeedback: false,
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              
              child: Container()
          ),
        );
    }

    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildKey(color: Colors.red, soundNum: 1),
        buildKey(color: Colors.orange, soundNum: 2),
        buildKey(color: Colors.yellow, soundNum: 3),
        buildKey(color: Colors.green, soundNum: 4),
        buildKey(color: Colors.teal, soundNum: 5),
        buildKey(color: Colors.blue, soundNum: 6),
        buildKey(color: Colors.purple, soundNum: 7),

      ],
    ));
  }
}
