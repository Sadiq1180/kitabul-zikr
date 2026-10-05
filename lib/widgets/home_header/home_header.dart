import 'package:flutter/material.dart';
import 'package:hizb_ul_bahr/core/app_colors.dart';
import 'package:hizb_ul_bahr/widgets/home_header/bismillah.dart';
import 'package:hizb_ul_bahr/widgets/home_header/divider.dart';
import 'package:hizb_ul_bahr/widgets/home_header/dot_pattern.dart';

import 'emblem.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 335,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF122745),
            AppColors.primary,
            AppColors.primaryLight,
          ],
          stops: [0.0, 0.55, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // --- Decorative background ---
          // Soft blue glow, top left
          Positioned(
            top: -90,
            left: -90,
            child: _glowCircle(280, const Color(0xFF5F86B5), 0.30),
          ),
          // Soft sand glow, bottom right
          Positioned(
            bottom: -110,
            right: -70,
            child: _glowCircle(260, AppColors.accent, 0.22),
          ),

          // Pattern (unchanged painter)
          Positioned.fill(child: CustomPaint(painter: DotPatternPainter())),

          // Top decorative arcs
          Positioned(
            top: -140,
            left: -40,
            right: -40,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.22),
                  width: 1.2,
                ),
              ),
            ),
          ),
          Positioned(
            top: -170,
            left: -40,
            right: -40,
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.12),
                  width: 1,
                ),
              ),
            ),
          ),

          // Thin sand line along the bottom edge
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.accent.withValues(alpha: 0.0),
                    AppColors.accent.withValues(alpha: 0.8),
                    AppColors.accent.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          // --- Content (unchanged) ---
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  // Emblem
                  Emblem(),

                  Spacer(),

                  // Bismillah with new font style
                  BismillahText(),

                  SizedBox(height: 14),

                  // Ornamental divider
                  OrnamentalDivider(), //
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glowCircle(double size, Color color, double alpha) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: alpha),
            color.withValues(alpha: 0.0),
          ],
        ),
      ),
    );
  }
}
