import 'package:flutter/material.dart';
import 'package:hizb_ul_bahr/widgets/home_header/dot_pattern.dart';

class IslamicPatternBackground extends StatelessWidget {
  const IslamicPatternBackground({
    super.key,
    required this.child,
    this.color = Colors.transparent,
    this.patternOpacity = 1.0,
  });

  final Widget child;
  final Color color;
  final double patternOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: DotPatternPainter(brightness: patternOpacity),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
