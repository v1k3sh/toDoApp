import 'package:flutter/material.dart';




class MyContainer extends StatefulWidget {
  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  double containerWidth = 200.0;
  double containerHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resizable Container'),
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              containerWidth += details.delta.dx;
              containerHeight += details.delta.dy;
            });
          },
          child: Container(
            width: containerWidth,
            height: containerHeight,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Drag me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
