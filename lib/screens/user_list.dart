import 'package:flutter/material.dart';

class UserMadeList extends StatefulWidget {
  final List<Widget> userMadePlanets;
  final List<String> sunValues;
  final List<String> earthValues;

  const UserMadeList(
      {Key key, this.userMadePlanets, this.sunValues, this.earthValues})
      : super(key: key);
  @override
  _UserMadeListState createState() => _UserMadeListState();
}

class _UserMadeListState extends State<UserMadeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: widget.userMadePlanets
              .asMap()
              .map(
                (i, element) => MapEntry(
                  i,
                  ListTile(
                    title: Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                    ),
                    subtitle: Text(widget.sunValues[0]),
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
