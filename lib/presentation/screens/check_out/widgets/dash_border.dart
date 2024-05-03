import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorder extends StatelessWidget {
  final Widget child;
  final Color color;

  const DashedBorder(
      {super.key, required this.child, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedPathPainter(color),
      child: child,
    );
  }
}

class DashedPathPainter extends CustomPainter {
  final Color color;

  DashedPathPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Adjust the dash array values to control the appearance of the dashed border
    final List<double> dashArray = <double>[4, 2];
    paint.strokeWidth = 2;

    canvas.drawPath(
      dashPath(path, dashArray: dashArray),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

Path dashPath(Path source, {List<double>? dashArray}) {
  final Path path = Path();
  final PathMetrics pathMetrics = source.computeMetrics();
  for (PathMetric pathMetric in pathMetrics) {
    double distance = 0.0;
    while (distance < pathMetric.length) {
      final double length = dashArray![0];
      final double space = dashArray[1];
      path.addPath(
        pathMetric.extractPath(distance, distance + length),
        Offset.zero,
      );
      distance += length + space;
    }
  }
  return path;
}
