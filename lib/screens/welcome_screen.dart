import 'package:asana/models/speech.dart';
import 'package:asana/models/welcoming_flares.dart';
import 'package:asana/screens/game_home.dart';
import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:audioplayers/audio_cache.dart';

class WelcomeScreeen extends StatefulWidget {
  @override
  _WelcomeScreeenState createState() => _WelcomeScreeenState();
}

class _WelcomeScreeenState extends State<WelcomeScreeen> {
  int speechIndex = 0;
  static AudioCache player = AudioCache();
  int result;
  @override
  void initState() {
    player.play('sounds/castlevania.mp3');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return Scaffold(
      backgroundColor: Color(0xff1C222D),
      body: Stack(
        children: <Widget>[
          MatrixGestureDetector(
            onMatrixUpdate: (m, tm, sm, rm) {
              notifier.value = m;
            },
            child: AnimatedBuilder(
              animation: notifier,
              builder: (ctx, child) {
                return Transform(
                    transform: notifier.value,
                    child: WelcomingFlares.welcomeflares[speechIndex]);
              },
            ),
          ),
          Positioned(
            left: 1,
            right: 1,
            bottom: 1,
            child: Container(
              color: Colors.white,
              width: 300,
              height: 120,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (speechIndex + 1 == Speech.speech.length - 1) {
                            print(Speech.speech.length);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameHome()));
                          } else
                            speechIndex += 1;
                        });
                      },
                      child: Text('Next'),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 1,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          speechIndex -= 1;
                          if (speechIndex < 0) {
                            speechIndex = 0;
                          }
                        });
                      },
                      child: Text('Previous'),
                    ),
                  ),
                  Positioned(
                    left: 1,
                    right: 1,
                    child: Container(
                        child: Center(
                      child: Text(
                        '${Speech.speech[speechIndex]}',
                        style: TextStyle(
                          fontFamily: 'arcade',
                          letterSpacing: 1,
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
