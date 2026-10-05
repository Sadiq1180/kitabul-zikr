import 'dart:math' as math;

import 'package:flutter/material.dart';

const _green = Color(0xFF064A3B);
const _darkGreen = Color(0xFF032F26);
const _gold = Color(0xFFD4A548);
const _lightGold = Color(0xFFF1D58A);
const _cream = Color(0xFFFFFCF2);

/// Compact Islamic-styled banner for sharing the app.
class InfoStrip extends StatelessWidget {
  final VoidCallback onShare;

  const InfoStrip({super.key, required this.onShare});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [_green, _darkGreen],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _gold.withValues(alpha: 0.45), width: 1),
        boxShadow: [
          BoxShadow(
            color: _darkGreen.withValues(alpha: 0.22),
            blurRadius: 16,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _StarPatternPainter(
                  color: _gold.withValues(alpha: 0.055),
                ),
              ),
            ),

            Positioned(
              left: -35,
              top: -45,
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [_gold.withValues(alpha: 0.16), Colors.transparent],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(13, 12, 12, 12),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    _IconBadge(),

                    const SizedBox(width: 11),

                    const Expanded(child: _InfoText()),

                    const SizedBox(width: 9),

                    _ShareButton(onTap: onShare),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _gold.withValues(alpha: 0.18),
            Colors.white.withValues(alpha: 0.04),
          ],
        ),
        border: Border.all(color: _gold.withValues(alpha: 0.65), width: 1),
      ),
      child: const Icon(
        Icons.auto_awesome_rounded,
        color: _lightGold,
        size: 21,
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'یہ ایپ دوسروں تک پہنچائیں',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: _cream,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 1.45,
          ),
        ),

        const SizedBox(height: 2),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 18,
              height: 1,
              color: _gold.withValues(alpha: 0.65),
            ),
            const SizedBox(width: 5),
            const Text(
              'صدقہ جاریہ میں حصہ لیں',
              style: TextStyle(
                color: _lightGold,
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ShareButton extends StatefulWidget {
  final VoidCallback onTap;

  const _ShareButton({required this.onTap});

  @override
  State<_ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<_ShareButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;

    setState(() {
      _pressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'ایپ شیئر کریں',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => _setPressed(true),
        onTapCancel: () => _setPressed(false),
        onTapUp: (_) => _setPressed(false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _pressed ? 0.94 : 1,
          duration: const Duration(milliseconds: 110),
          child: Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 13),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_gold, Color(0xFFB88A3E)],
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: _gold.withValues(alpha: 0.25),
                  blurRadius: 9,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.share_rounded, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  'شیئر',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StarPatternPainter extends CustomPainter {
  final Color color;

  _StarPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    const double step = 42;
    const double outer = 12;
    const double inner = 5.5;

    for (double cx = step / 2; cx < size.width + step; cx += step) {
      for (double cy = step / 2; cy < size.height + step; cy += step) {
        final path = Path();

        for (int i = 0; i < 16; i++) {
          final radius = i.isEven ? outer : inner;
          final angle = (i * math.pi / 8) - math.pi / 2;

          final x = cx + radius * math.cos(angle);
          final y = cy + radius * math.sin(angle);

          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }

        path.close();
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
