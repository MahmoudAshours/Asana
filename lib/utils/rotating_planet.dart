import 'package:flutter/material.dart';

class RotatingPlanet extends StatefulWidget {
  final Widget comingPlanet;
  final int rotationDuration;
  final double rotationSpeed;
  final double width;
  final double height;
  final bool repetetion;
  final double distance;
  final int test;
  const RotatingPlanet(
      {Key key,
      this.comingPlanet,
      this.rotationDuration,
      this.rotationSpeed,
      this.width,
      this.height,
      this.repetetion,
      this.distance,
      this.test})
      : super(key: key);

  @override
  _RotatingPlanetState createState() => _RotatingPlanetState();
}

class _RotatingPlanetState extends State<RotatingPlanet>
    with TickerProviderStateMixin {
  AnimationController rotationController;
  Animation<double> alpha;
  @override
  void initState() {
    rotationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.rotationDuration));
    alpha = Tween<double>(begin: 0, end: widget.rotationSpeed).animate(rotationController);
    rotationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: alpha,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: widget.comingPlanet,
          width: widget.width,
          height: widget.height,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
