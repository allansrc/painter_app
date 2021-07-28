import 'package:flutter/material.dart';

import 'customPainters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(40),
          color: Colors.white,
          child: LayoutBuilder(
            builder: (_, constraints) => Container(
              width: constraints.widthConstraints().maxWidth,
              height: constraints.heightConstraints().maxHeight,
              color: Colors.amber,
              child: CustomPaint(painter: ThePainter()),
            ),
          ),
        ),
      ),
    );
  }
}

class ThePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var line = Paint()
      ..strokeWidth = 5
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
