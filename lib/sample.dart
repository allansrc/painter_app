import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Offset?> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40),
          color: Colors.white,
          child: Container(
            color: Colors.amber,
            child: CustomPaint(painter: OurPainter(_points)),
          ),
        ),
      ),
    );
  }
}

class OurPainter extends CustomPainter {
  final List<Offset?> points;

  OurPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var line = Paint()
      ..strokeWidth = 5
      ..color = Colors.black
      ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
