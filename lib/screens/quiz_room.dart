import 'package:flutter/material.dart';

class QuizRoom extends StatefulWidget {
  final List planetsAtmosphere;
  final List planetsMagneticField;
  final List listofPlanets;
  final List typesOfPlanets;

  const QuizRoom(
      {Key key,
      this.planetsAtmosphere,
      this.planetsMagneticField,
      this.listofPlanets,
      this.typesOfPlanets})
      : super(key: key);
  @override
  _QuizRoomState createState() => _QuizRoomState();
}

class _QuizRoomState extends State<QuizRoom> {
  @override
  void initState() {
    widget.listofPlanets.removeAt(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.listofPlanets
                .asMap()
                .map(
                  (i, element) => MapEntry(
                    i,
                    GestureDetector(
                      onTap: () {
                        check(i);
                      },
                      child: Container(
                        key: Key('$i'),
                        padding: EdgeInsets.all(1),
                        width: 100,
                        height: 500,
                        child: element,
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
      ),
    );
  }

  check(int index) {
    if (widget.planetsAtmosphere[index] == 'Thick atmosphere' &&
        widget.planetsMagneticField[index] == 'Strong Magnetic Field' &&
        index > 3 &&
        widget.typesOfPlanets[index] == "Rock planet") {
      showModal(
          "Hurraaayy! you did it! You found the right planet to Live on !");
    } else {
      if (index < 3) {
        showModal('The Planet is near the sun a little bit , try again!');
      } else {
        if (widget.planetsAtmosphere[index] != 'Thick atmosphere') {
          showModal('The sun rays can cut through it easily , try again!');
        }
      }
    }
  }

  showModal(String message) {
    showModalBottomSheet(
      context: context,
      builder: (builder) => Container(
        width: 100,
        height: 100,
        color: Colors.black,
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'arcade', color: Colors.white, letterSpacing: 2),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
    );
  }

  removeSun(List includeSun) {
    for (int i = includeSun.length; i > 0; i--) {
      includeSun.removeLast();
    }
  }
}
