import 'package:flutter/material.dart';
import 'package:sweetr/core/utils/sugar_level_utils.dart';

class SugarLevelBarWidget extends StatelessWidget {
  final double sugarPer100g;
  final String productUnit;

  const SugarLevelBarWidget({
    super.key,
    required this.sugarPer100g,
    required this.productUnit,
  });

  @override
  Widget build(BuildContext context) {
    final progress = SugarLevelUtils.getProgressValue(sugarPer100g, productUnit);
    final color = SugarLevelUtils.getSugarLevelColor(sugarPer100g, productUnit);

    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CustomPaint(
            painter: CircularLevelBarPainter(progress: progress, color: color),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${sugarPer100g.toStringAsFixed(1)}g',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    'per 100${productUnit.toLowerCase()}',
                    style: TextStyle(fontSize: 8, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          SugarLevelUtils.getSugarLevelText(sugarPer100g, productUnit),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

// Custom painter for the circular level bar
class CircularLevelBarPainter extends CustomPainter {
  final double progress;
  final Color color;

  CircularLevelBarPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 8.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - (strokeWidth / 2);

    // Background circle
    final backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.5 * 3.14159, // Start from top
      2 * 3.14159 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is CircularLevelBarPainter) {
      return oldDelegate.progress != progress || oldDelegate.color != color;
    }
    return true;
  }
}
