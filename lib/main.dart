import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

void audioPlayerHandler(AudioPlayerState value) => null;

class GameController {
  static AudioPlayer audioPlayer = AudioPlayer();
  static AudioCache audioCache = AudioCache();
  

  static void play(String sound) async {
    if (Platform.isIOS) {
      audioPlayer.monitorNotificationStateChanges(audioPlayerHandler);
    }
    await audioCache.play(sound);
  }
}

class XylophoneApp extends StatelessWidget {

  List<Widget> genWidgets(){
    List wavs = [
      {"color": Colors.red, "audio": "note1.wav" },
      {"color": Colors.orange, "audio": "note2.wav" },
      {"color": Colors.yellow, "audio": "note3.wav" },
      {"color": Colors.green, "audio": "note4.wav" },
      {"color": Colors.teal, "audio": "note5.wav" },
      {"color": Colors.blue, "audio": "note6.wav" },
      {"color": Colors.purple, "audio": "note7.wav" },
      ];
    return wavs.map((e){
      return Expanded(
        child: FlatButton(
          color: e["color"],
          onPressed: (){
            GameController.play(e["audio"]);
          },
        ),
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: genWidgets(),
          ),
        ),
      ),
    );
  }
}
