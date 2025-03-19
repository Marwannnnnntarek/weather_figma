import 'package:flutter/material.dart';

class TemperatureGraphPainter extends CustomPainter {
  final List<double> temperatures = [5, 7, 12, 16, 20, 23, 25, 22, 18, 14];

  TemperatureGraphPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint =
        Paint()
          ..color = Color(0xFF4C4DDB)
          ..strokeWidth =
              3 // Line weight
          ..style =
              PaintingStyle
                  .stroke // Solid stroke style
          ..strokeCap = StrokeCap.round; // Round start and end points

    Path path = Path();

    double spacing = size.width / (temperatures.length - 1);
    double maxTemp = temperatures.reduce((a, b) => a > b ? a : b);

    // Scale temperatures to fit within canvas height
    double scaleFactor = size.height / maxTemp;

    // Start path from the first temperature point
    path.moveTo(0, size.height - temperatures[0] * scaleFactor);

    for (int i = 1; i < temperatures.length; i++) {
      double x = i * spacing;
      double y = size.height - temperatures[i] * scaleFactor;

      double prevX = (i - 1) * spacing;
      double prevY = size.height - temperatures[i - 1] * scaleFactor;

      // Smooth curve using quadratic Bézier
      path.quadraticBezierTo(
        (prevX + x) / 2,
        prevY, // Control point for smooth transition
        x,
        y, // End point
      );
    }

    // Centering the path horizontally
    double offsetX = (size.width - spacing * (temperatures.length - 1)) / 2;
    canvas.translate(offsetX, 0);

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
