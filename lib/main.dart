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
        floatingActionButton: FloatingActionButton(onPressed: () {
          _points.clear();
        }),
        body: Container(
          padding: EdgeInsets.all(40),
          color: Colors.white,
          child: LayoutBuilder(
            builder: (_, constraints) => GestureDetector(
              onPanUpdate: (pan) {
                setState(() {
                  RenderBox _box = context.findRenderObject() as RenderBox;
                  Offset _coordPoints = _box.localToGlobal(pan.localPosition);
                  _points = List.from(_points)..add(_coordPoints);
                });
              },
              onPanEnd: (endPan) {
                setState(() => _points.add(null));
              },
              child: Container(
                width: constraints.widthConstraints().maxWidth,
                height: constraints.heightConstraints().maxHeight,
                color: Colors.amber,
                child: CustomPaint(painter: ThePainter(_points)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ThePainter extends CustomPainter {
  final List<Offset?> points;

  ThePainter(this.points);
  @override
  void paint(Canvas canvas, Size size) {
    var line = Paint()
      ..strokeWidth = 1.5
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
