import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hizb_ul_bahr/core/app_colors.dart';

/// Islamic-style star lattice background.
/// (Class name kept as DotPatternPainter so existing code still works.)
class DotPatternPainter extends CustomPainter {
  const DotPatternPainter();

  // ---- Tune these to make the pattern brighter or softer ----
  static const double _cell = 64; // distance between stars
  static const double _starHalf = 16; // half the side of each square
  static const double _diamond = 3.6; // size of the small diamonds
  static const double _lineWidth = 1.4; // star line thickness
  static const double _starAlpha = 0.30; // star line brightness (0 to 1)
  static const double _dotAlpha = 0.75; // center dot brightness
  static const double _dotRadius = 2.4; // center dot size
  static const double _diamondAlpha = 0.65; // sand diamond brightness
  static const double _glowAlpha = 0.28; // soft glow behind the dots
  static const double _bottomFade = 0.60; // 1.0 = no fade toward the bottom

  @override
  void paint(Canvas canvas, Size size) {
    final starPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _lineWidth
      ..strokeJoin = StrokeJoin.miter;
    final dotPaint = Paint()..style = PaintingStyle.fill;
    final glowPaint = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);
    final diamondPaint = Paint()..style = PaintingStyle.fill;

    final starRect = Rect.fromCenter(
      center: Offset.zero,
      width: _starHalf * 2,
      height: _starHalf * 2,
    );

    for (double y = _cell / 2; y < size.height + _cell; y += _cell) {
      final t = (y / size.height).clamp(0.0, 1.0);
      final fade = 1.0 - (1.0 - _bottomFade) * t;

      starPaint.color = Colors.white.withValues(alpha: _starAlpha * fade);
      dotPaint.color = Colors.white.withValues(alpha: _dotAlpha * fade);
      glowPaint.color = AppColors.accent.withValues(alpha: _glowAlpha * fade);
      diamondPaint.color = AppColors.accent.withValues(
        alpha: _diamondAlpha * fade,
      );

      for (double x = _cell / 2; x < size.width + _cell; x += _cell) {
        // Eight-pointed star: square + the same square rotated 45 degrees.
        canvas.save();
        canvas.translate(x, y);
        canvas.drawRect(starRect, starPaint);
        canvas.rotate(math.pi / 4);
        canvas.drawRect(starRect, starPaint);
        canvas.restore();

        // Soft dot in the middle of the star.
        canvas.drawCircle(Offset(x, y), _dotRadius * 2.2, glowPaint);
        canvas.drawCircle(Offset(x, y), _dotRadius, dotPaint);

        // Sand diamond between four stars.
        final dx = x + _cell / 2;
        final dy = y + _cell / 2;
        final diamond = Path()
          ..moveTo(dx, dy - _diamond)
          ..lineTo(dx + _diamond, dy)
          ..lineTo(dx, dy + _diamond)
          ..lineTo(dx - _diamond, dy)
          ..close();
        canvas.drawCircle(Offset(dx, dy), _diamond * 1.8, glowPaint);
        canvas.drawPath(diamond, diamondPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
