import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hizb_ul_bahr/core/app_colors.dart';

/// Islamic-style eight-pointed star lattice background.
class DotPatternPainter extends CustomPainter {
  const DotPatternPainter({this.brightness = 1.0});

  /// Pattern brightness: 0.0 (invisible) to 1.0 (full brightness).
  final double brightness;

  // Original pattern settings.
  static const double _cell = 64;
  static const double _starHalf = 16;
  static const double _diamond = 3.6;
  static const double _lineWidth = 1.4;
  static const double _starAlpha = 0.30;
  static const double _dotAlpha = 0.75;
  static const double _dotRadius = 2.4;
  static const double _diamondAlpha = 0.65;
  static const double _glowAlpha = 0.28;
  static const double _bottomFade = 0.60;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty || brightness <= 0) return;

    final amount = brightness.clamp(0.0, 1.0);

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
      final alpha = fade * amount;

      starPaint.color = Colors.white.withValues(alpha: _starAlpha * alpha);

      dotPaint.color = Colors.white.withValues(alpha: _dotAlpha * alpha);

      glowPaint.color = AppColors.accent.withValues(alpha: _glowAlpha * alpha);

      diamondPaint.color = AppColors.accent.withValues(
        alpha: _diamondAlpha * alpha,
      );

      for (double x = _cell / 2; x < size.width + _cell; x += _cell) {
        // Original eight-pointed star.
        canvas.save();
        canvas.translate(x, y);
        canvas.drawRect(starRect, starPaint);
        canvas.rotate(math.pi / 4);
        canvas.drawRect(starRect, starPaint);
        canvas.restore();

        // Center dot and soft glow.
        canvas.drawCircle(Offset(x, y), _dotRadius * 2.2, glowPaint);

        canvas.drawCircle(Offset(x, y), _dotRadius, dotPaint);

        // Small diamond between four stars.
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
  bool shouldRepaint(covariant DotPatternPainter oldDelegate) {
    return oldDelegate.brightness != brightness;
  }
}
