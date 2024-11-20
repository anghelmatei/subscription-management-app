import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart'; // Remove if not required.
import 'dart:math'; // Import this to use cos() and sin().
import '../common/color_extension.dart';

class ArcValueModel {
  final Color color;
  final double value;

  ArcValueModel({required this.color, required this.value});
}

class CustomArc180Painter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double bgWidth;
  final double blurWidth;
  final List<ArcValueModel> drwArcs;

  CustomArc180Painter(
      {required this.drwArcs, this.start = 0, this.end = 180, this.width = 15, this.bgWidth = 10, this.blurWidth = 4});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height),
        radius: size.width / 2);

    // Background Arc
    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray60.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgWidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    var startVal = 180.0 + start;
    canvas.drawArc(rect, radians(startVal), radians(180), false, backgroundPaint);

    double drawStart = startVal;

    // Iterate through each arc
    for (var arcObj in drwArcs) {
      Paint activePaint = Paint();
      activePaint.color = arcObj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      // Draw Shadow Arc
      Paint shadowPaint = Paint()
        ..color = arcObj.color.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurWidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      Path shadowPath = Path();
      shadowPath.addArc(rect, radians(drawStart), radians(arcObj.value));
      canvas.drawPath(shadowPath, shadowPaint);

      // Draw Active Arc
      canvas.drawArc(rect, radians(drawStart), radians(arcObj.value), false, activePaint);

      // Draw a black line between arcs (to create the separation)
      if (drawStart + arcObj.value < 180) {
        Paint blackLinePaint = Paint()
          ..color = TColor.primaryText // Use Colors from Material package
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1; // thin black line to separate arcs

        // Compute the end point of the black line
        double x1 = size.width / 2 + (size.width / 2) * cos(radians(drawStart + arcObj.value));
        double y1 = size.height + (size.width / 2) * sin(radians(drawStart + arcObj.value));

        canvas.drawLine(
          Offset(size.width / 2, size.height), // Start at the center of the circle
          Offset(x1, y1), // End at the computed point
          blackLinePaint,
        );
      }

      // Update drawStart for next arc
      drawStart = drawStart + arcObj.value;
    }
  }

  @override
  bool shouldRepaint(CustomArc180Painter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArc180Painter oldDelegate) => false;
}