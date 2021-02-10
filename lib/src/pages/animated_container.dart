import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 10;
  double _height = 10;
  Color _color = Colors.black;
  BorderRadius _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contenedor animado"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.all_inclusive),
        onPressed: () {
          setState(() {
            Random r = Random();
            _width = r.nextInt(300).toDouble();
            _height = r.nextInt(600).toDouble();
            _color = Color.fromRGBO(
              r.nextInt(255),
              r.nextInt(255),
              r.nextInt(255),
              1,
            );
            _borderRadius = BorderRadius.circular(r.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}
