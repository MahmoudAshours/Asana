import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
class MoonFlare extends StatefulWidget {
  @override
  _MoonFlareState createState() => _MoonFlareState();
}

class _MoonFlareState extends State<MoonFlare> {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'assets/flare/rockPlanet.flr',
    );
  }
}