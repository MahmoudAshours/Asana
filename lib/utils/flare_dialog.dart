import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareDialog extends StatelessWidget {
  final FlareActor flareActor;
  final String flareAnimation;
  final Text title;
  final Widget description;
  final bool onlyOkButton;
  final Text buttonOkText;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final Color cardBackgroundColor;
  final double buttonRadius;
  final double cornerRadius;
  final VoidCallback onOkButtonPressed;

  FlareDialog({
    Key key,
    @required this.flareActor,
    @required this.flareAnimation,
    @required this.title,
    @required this.onOkButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.cardBackgroundColor,
    this.buttonOkColor,
    this.buttonCancelColor,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  })  : assert(flareActor != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius)),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: (MediaQuery.of(context).size.height / 2) * 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/space.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: flareActor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: title,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: description,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: !onlyOkButton
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: <Widget>[
                  !onlyOkButton
                      ? RaisedButton(
                          color: buttonCancelColor ?? Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(buttonRadius)),
                          onPressed: () => Navigator.of(context).pop(),
                          child: buttonCancelText ??
                              Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'arcade',
                                ),
                              ),
                        )
                      : Container(),
                  RaisedButton(
                    color: buttonOkColor ?? Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonRadius)),
                    onPressed: onOkButtonPressed ?? () {},
                    child: buttonOkText ??
                        Text(
                          'Add!',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'arcade'),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
