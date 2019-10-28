import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomingFlares {
  static List<Widget> welcomeflares = [
    FlareActor(
      "assets/flare/buzz.flr",
      animation: 'andBeyond',
      fit: BoxFit.contain,
    ),
     FlareActor(
      "assets/flare/buzz.flr",
      animation: 'downToUp',
      fit: BoxFit.contain,
    ),
    FlareActor(
      "assets/flare/Solar.flr",
      animation: 'rotate',
      fit: BoxFit.contain,
    ),
    FlareActor(
      "assets/flare/earth.flr",
      animation: 'zooming',
      fit: BoxFit.contain,
    ),
    FlareActor(
      "assets/flare/earth.flr",
      animation: 'meteor',
      fit: BoxFit.contain,
    ),
  ];
}
