import 'package:flutter/material.dart';
class FlareAdapter extends StatefulWidget {
  @override
  _FlareAdapterState createState() => _FlareAdapterState();
}

class _FlareAdapterState extends State<FlareAdapter> {

    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}