import 'package:asana/models/radiobutton_choices.dart';
import 'package:asana/models/tips.dart';
import 'package:asana/screens/quiz_room.dart';
import 'package:asana/screens/user_list.dart';
import 'package:asana/utils/flare_dialog.dart';
import 'package:asana/utils/rotating_planet.dart';
import 'package:asana/utils/zoomable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class GameHome extends StatefulWidget {
  @override
  _GameHomeState createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome>
    with SingleTickerProviderStateMixin {
  String flarePath = '',
      flareAnimation = '',
      chosenValue = '',
      chosenSun = '',
      chosenPlanet = '',
      atmosphere = '',
      magneticField = '';
  double size = 0, rotateX = 90, rotateY = 90;
  double rotationSpeed = 1;
  Tips tip = new Tips();
  Icon playIcon = Icon(Icons.play_arrow);
  RadioButtonChoices _radioButtonChoices = RadioButtonChoices();
  List<Widget> planetsUserMade = new List();
  List<String> sunValues = new List(),
      planetValues = new List(),
      allValues = new List(),
      atmosphereValues = new List(),
      magneticValues = new List();
  bool playIconBool = true;
  final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());

  @override
  Widget build(BuildContext context) {
    ValueNotifier planetsValueNotifier = ValueNotifier(planetsUserMade.length);

    return Scaffold(
      backgroundColor: Color(0xff1C222D),
      appBar: AppBar(
        backgroundColor: Color(0xff1C222D),
        elevation: 0,
        title: Row(
          children: <Widget>[
            IconButton(
              icon: playIcon,
              onPressed: () {
                setState(
                  () {
                    rotationSpeed *= 10;
                    showModal(
                      'You have spead up the Rotations of solar system',
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.gamepad),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizRoom(
                      listofPlanets: planetsUserMade,
                      typesOfPlanets: planetValues,
                      planetsAtmosphere: atmosphereValues,
                      planetsMagneticField: magneticValues,
                    ),
                  ),
                );
              },
            )
          ],
        ),
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => StatefulBuilder(
                builder: (context, setState) {
                  return FlareDialog(
                    cardBackgroundColor: Color(0xff1C222D),
                    cornerRadius: 90,
                    flareActor: FlareActor(
                      flarePath,
                      animation: flareAnimation,
                    ),
                    flareAnimation: flareAnimation,
                    title: Text(
                      'Add Up to your solar system!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'arcade',
                      ),
                    ),
                    description: SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Tooltip(
                                message: 'as',
                                child: CustomRadioButton(
                                  buttonColor: Colors.red,
                                  enableShape: true,
                                  buttonLables:
                                      _radioButtonChoices.firstChoices,
                                  buttonValues:
                                      _radioButtonChoices.firstChoices,
                                  elevation: 0,
                                  radioButtonValue: (value) => {
                                    setState(
                                      () {
                                        if (value == "Star") {
                                          flarePath = 'assets/flare/Sun.flr';
                                          chosenValue = value;
                                          allValues.add(value);
                                        } else {
                                          flarePath = "assets/flare/earth.flr";
                                          chosenValue = value;
                                          allValues.add(value);
                                        }
                                      },
                                    ),
                                  },
                                  selectedColor: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            chosenValue == "Star"
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: CustomRadioButton(
                                      buttonColor: Colors.red,
                                      enableShape: true,
                                      hight: 40,
                                      buttonLables:
                                          _radioButtonChoices.sunFirstChoices,
                                      buttonValues:
                                          _radioButtonChoices.sunFirstChoices,
                                      elevation: 0,
                                      radioButtonValue: (value) => {
                                        setState(
                                          () {
                                            if (value == 'Yellow dwarf') {
                                              chosenSun = value;
                                              sunValues.add(value);
                                            } else {
                                              chosenSun = value;
                                              sunValues.add(value);
                                            }
                                          },
                                        ),
                                      },
                                      selectedColor:
                                          Theme.of(context).accentColor,
                                    ),
                                  )
                                : Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: CustomRadioButton(
                                      buttonColor: Colors.red,
                                      enableShape: true,
                                      hight: 40,
                                      buttonLables: _radioButtonChoices
                                          .planetsFirstChoices,
                                      buttonValues: _radioButtonChoices
                                          .planetsFirstChoices,
                                      elevation: 0,
                                      radioButtonValue: (value) => {
                                        setState(
                                          () {
                                            if (value == 'Gaseous Planet') {
                                              flarePath =
                                                  'assets/flare/gaseousPlanet.flr';
                                              chosenPlanet = value;
                                              planetValues.add(value);
                                            } else {
                                              flarePath =
                                                  'assets/flare/rockPlanet.flr';
                                              chosenPlanet = value;
                                              planetValues.add(value);
                                            }
                                          },
                                        ),
                                      },
                                      selectedColor:
                                          Theme.of(context).accentColor,
                                    ),
                                  ),
                            chosenValue == 'Planet'
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: CustomRadioButton(
                                      buttonColor: Colors.red,
                                      enableShape: true,
                                      hight: 40,
                                      buttonLables:
                                          _radioButtonChoices.atmospheres,
                                      buttonValues:
                                          _radioButtonChoices.atmospheres,
                                      elevation: 0,
                                      radioButtonValue: (value) => {
                                        setState(
                                          () {
                                            if (value == 'Thick atmosphere ') {
                                              atmosphere = value;
                                              atmosphereValues.add(value);
                                            } else {
                                              atmosphere = value;
                                              atmosphereValues.add(value);
                                            }
                                          },
                                        ),
                                      },
                                      selectedColor:
                                          Theme.of(context).accentColor,
                                    ),
                                  )
                                : Text(''),
                            chosenValue == 'Planet'
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: CustomRadioButton(
                                      buttonColor: Colors.red,
                                      enableShape: true,
                                      hight: 40,
                                      buttonLables:
                                          _radioButtonChoices.magneticField,
                                      buttonValues:
                                          _radioButtonChoices.atmospheres,
                                      elevation: 0,
                                      radioButtonValue: (value) => {
                                        setState(
                                          () {
                                            if (value ==
                                                'Strong Magnetic Field') {
                                              magneticField = value;
                                              magneticValues.add(value);
                                            } else {
                                              magneticField = value;
                                              magneticValues.add(value);
                                            }
                                          },
                                        ),
                                      },
                                      selectedColor:
                                          Theme.of(context).accentColor,
                                    ),
                                  )
                                : Text(''),
                          ],
                        ),
                      ),
                    ),
                    onOkButtonPressed: () {
                      setState(
                        () {
                          if (checkIfNotSum()) {
                            showModal('You should start with the star first!');
                            Navigator.of(context).pop();
                          } else {
                            planetsUserMade.add(
                              SizedBox(
                                child: FlareActor(
                                  flarePath,
                                  animation: flareAnimation,
                                  alignment: Alignment.center,
                                ),
                              ),
                            );
                            planetsValueNotifier.value++;
                          }
                        },
                      );
                      Navigator.of(context).pop();
                      if (!checkIfNotSum()) {
                        showModal('You have added up to your Solar System!');
                        print('object');
                      }
                      chosenPlanet == 'Gaseous Planet'
                          ? showModal(tip.creationTips[0])
                          : null;
                    },
                  );
                },
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ZoomableWidget(
          child: ValueListenableBuilder(
            valueListenable: planetsValueNotifier,
            builder: (context, value, child) {
              return AnimatedBuilder(
                animation: notifier,
                builder: (ctx, child) {
                  return Transform(
                    transform: notifier.value,
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 100,
                        width: MediaQuery.of(context).size.width * 100,
                        child: Stack(
                          alignment: Alignment.center,
                          children: planetsUserMade
                              .asMap()
                              .map(
                                (i, element) => MapEntry(
                                  i,
                                  i == 0
                                      ? AnimatedPositioned(
                                          duration: Duration(seconds: 8),
                                          left: 0,
                                          top: 0,
                                          bottom: 1,
                                          child: Container(
                                            child: element,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(30),
                                              ),
                                            ),
                                            width: chosenSun == "Orange dwarf"
                                                ? 300
                                                : 200,
                                            alignment: Alignment.center,
                                          ),
                                        )
                                      : AnimatedPositioned(
                                          key: Key('$i'),
                                          duration: Duration(seconds: 8),
                                          left: 0,
                                          top: 0,
                                          bottom: 0,
                                          child: RotatingPlanet(
                                            rotationSpeed: rotationSpeed,
                                            comingPlanet: Transform.rotate(
                                              angle: 90.0,
                                              origin: Offset(
                                                rotateX,
                                                i * rotateX,
                                              ),
                                              child: element,
                                            ),
                                            height: 200,
                                            width: 100,
                                            rotationDuration: i * 2,
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
                },
              );
            },
          ),
        ),
      ),
    );
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

  checkIfNotSum() {
    if (allValues[0] != 'Star') {
      return true;
    }
    return false;
  }
}
