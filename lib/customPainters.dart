import 'package:flutter/material.dart';

class OurPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// [ Demo Line render ]
    var line = Paint()
      ..strokeWidth = 5
      ..color = Colors.teal
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke; // [needed by using path]

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, line);

    /// [ Demo line using path ]
    var path = Path();
    path.moveTo(0, size.height / 3);
    path.lineTo(size.width, size.height / 3);
    canvas.drawPath(path, line);

    /// [ Demo cricle ]
    var circle = Paint()
      ..strokeWidth = 5
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 100, circle);

    /// [ Demo single point render ]
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
