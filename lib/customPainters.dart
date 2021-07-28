import 'package:flutter/material.dart';

class OurPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// [ Demo Line render ]
    var line = Paint()
      ..strokeWidth = 5
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, line);

    /// [ Demo cricle ]
    var circle = Paint()
      ..strokeWidth = 5
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 200, circle);

    /// [ Demo  forns from rect ]
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(20, 35, 100, 100),
        Radius.circular(20),
      ),
      line,
    );

    /// [ Demo oval ]
    canvas.drawOval(
      Rect.fromLTWH(20, 35, 100, 100),
      line,
    );

    /// [ Demo path ]
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

    /// [ Demo line using path ]
    var pathLine = Path();

    pathLine.moveTo(0, size.height / 3);
    pathLine.lineTo(size.width, size.height / 3);

    canvas.drawPath(pathLine, line);

    /// [Demo arch path]
    final arch = Path();
    arch.moveTo(173, 142);
    arch.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.6),
      radius: Radius.circular(150),
    );
    // arch.arcToPoint(
    //   Offset(size.width * 0.8, size.height * 0.6),
    //   radius: Radius.circular(170),
    //   clockwise: false,
    // );
    // arch.arcToPoint(
    //   Offset(size.width * .65, 142),
    //   radius: Radius.circular(170),
    //   clockwise: true,
    // );

    canvas.drawPath(arch, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class GeometricsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(GeometricsPainter oldDelegate) => false;
}
