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

    var pathLine = Path();
    pathLine.moveTo(0, size.height / 3);
    pathLine.lineTo(size.width, size.height / 3);
    canvas.drawPath(pathLine, line);

    var circle = Paint()
      ..strokeWidth = 5
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 200, circle);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(20, 35, 100, 100),
        Radius.circular(20),
      ),
      line,
    );

    final arch = Path();
    arch.moveTo(173, 142);
    arch.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.6),
      radius: Radius.circular(150),
    );
    arch.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.6),
      radius: Radius.circular(170),
      clockwise: false,
    );
    arch.arcToPoint(
      Offset(size.width * .65, 142),
      radius: Radius.circular(170),
      clockwise: true,
    );

    canvas.drawPath(arch, line);

    canvas.drawOval(
      Rect.fromLTWH(20, 35, 100, 100),
      line,
    );

    var circleLine = Paint()
      ..strokeWidth = 5
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var pathCircle = Path();
    pathCircle.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: 100,
    ));
    canvas.drawPath(pathCircle, circleLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
