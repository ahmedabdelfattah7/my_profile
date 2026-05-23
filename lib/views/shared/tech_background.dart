import 'dart:math' as math;
import 'package:flutter/material.dart';

class TechBackground extends StatelessWidget {
  const TechBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: RepaintBoundary(
        child: CustomPaint(
          painter: _TechBackgroundPainter(
            colorScheme: Theme.of(context).colorScheme,
          ),
        ),
      ),
    );
  }
}

class _TechBackgroundPainter extends CustomPainter {
  _TechBackgroundPainter({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  void paint(Canvas canvas, Size size) {
    final brightness = colorScheme.brightness;
    final isDark = brightness == Brightness.dark;

    // Adapt shape and grid opacities based on current theme brightness
    // In light mode, shapes need higher opacity (e.g. 18%) to be visible on F4F4EF background.
    final primaryOpacity = isDark ? 0.05 : 0.18;
    final secondaryOpacity = isDark ? 0.05 : 0.18;
    final dotOpacity = isDark ? 0.03 : 0.08;

    final primary = colorScheme.primary.withValues(alpha: primaryOpacity);
    final secondary = colorScheme.secondary.withValues(alpha: secondaryOpacity);

    _drawDotGrid(canvas, size, colorScheme.onSurface.withValues(alpha: dotOpacity));
    _drawShapes(canvas, size, primary, secondary);
  }

  void _drawDotGrid(Canvas canvas, Size size, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const spacing = 40.0;
    const radius = 1.5;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  void _drawShapes(Canvas canvas, Size size, Color color1, Color color2) {
    final paint1 = Paint()
      ..color = color1
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paint2 = Paint()
      ..color = color2
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Top right circle
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.15),
      150,
      paint1,
    );

    // Bottom left polygon (hexagon)
    _drawHexagon(
      canvas,
      Offset(size.width * 0.1, size.height * 0.8),
      120,
      paint2,
    );

    // Center right arc and top left small circle using cascades
    final rect = Rect.fromCircle(
      center: Offset(size.width * 0.9, size.height * 0.6),
      radius: 200,
    );
    canvas
      ..drawArc(rect, math.pi / 2, math.pi, false, paint1)
      ..drawCircle(
        Offset(size.width * 0.2, size.height * 0.25),
        80,
        paint2,
      );
  }

  void _drawHexagon(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path()..moveTo(center.dx + radius, center.dy);
    for (var i = 1; i < 6; i++) {
      final angle = (math.pi / 3) * i;
      final point = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
      path.lineTo(point.dx, point.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TechBackgroundPainter oldDelegate) {
    return oldDelegate.colorScheme != colorScheme;
  }
}
