import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hizb_ul_bahr/core/app_constants.dart';

class Emblem extends StatelessWidget {
  const Emblem({super.key});

  static const Color _green = Color(0xFF064A3B);
  static const Color _darkGreen = Color(0xFF032F26);
  static const Color _gold = Color(0xFFD4A548);
  static const Color _lightGold = Color(0xFFF1D58A);
  static const Color _cream = Color(0xFFFFF9E8);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 170,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Soft outer glow
          Container(
            width: 154,
            height: 154,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _gold.withValues(alpha: 0.20),
                  blurRadius: 30,
                  spreadRadius: 3,
                ),
              ],
            ),
          ),

          // Decorative outer ring
          Container(
            width: 154,
            height: 154,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _gold.withValues(alpha: 0.30),
                width: 1,
              ),
            ),
          ),

          // Rotated ornamental frame
          Transform.rotate(
            angle: math.pi / 4,
            child: Container(
              width: 132,
              height: 132,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [
                    _gold.withValues(alpha: 0.95),
                    _lightGold.withValues(alpha: 0.55),
                    _gold.withValues(alpha: 0.95),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: _gold.withValues(alpha: 0.18),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: _darkGreen,
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
            ),
          ),

          // Main circular seal
          Container(
            width: 126,
            height: 126,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                center: Alignment.center,
                radius: 0.85,
                colors: [_green, _darkGreen],
              ),
              border: Border.all(color: _gold, width: 2.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.28),
                  blurRadius: 16,
                  offset: const Offset(0, 7),
                ),
                BoxShadow(
                  color: _gold.withValues(alpha: 0.20),
                  blurRadius: 20,
                  spreadRadius: -3,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Inner gold ring
                Container(
                  width: 108,
                  height: 108,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _gold.withValues(alpha: 0.55),
                      width: 1,
                    ),
                  ),
                ),

                // Top ornament
                const Positioned(
                  top: 13,
                  child: Icon(Icons.auto_awesome, size: 13, color: _lightGold),
                ),

                // Bottom ornament
                const Positioned(
                  bottom: 13,
                  child: Icon(Icons.auto_awesome, size: 11, color: _lightGold),
                ),

                // Main content
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 3),

                    // Small Arabic-style divider
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 18,
                          height: 1,
                          color: _gold.withValues(alpha: 0.75),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.star, size: 8, color: _lightGold),
                        const SizedBox(width: 6),
                        Container(
                          width: 18,
                          height: 1,
                          color: _gold.withValues(alpha: 0.75),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(
                        AppConstants.appName,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontFamily: AppConstants.arabicNameFont,
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          height: 1.35,
                          color: _cream,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.35),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Bottom divider
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 14,
                          height: 1,
                          color: _gold.withValues(alpha: 0.65),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: _gold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 14,
                          height: 1,
                          color: _gold.withValues(alpha: 0.65),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Four small decorative diamonds
          Positioned(top: 8, child: _diamond(8)),
          Positioned(bottom: 8, child: _diamond(8)),
          Positioned(left: 8, child: _diamond(8)),
          Positioned(right: 8, child: _diamond(8)),
        ],
      ),
    );
  }

  Widget _diamond(double size) {
    return Transform.rotate(
      angle: math.pi / 4,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: _darkGreen,
          border: Border.all(color: _gold.withValues(alpha: 0.85), width: 1),
        ),
      ),
    );
  }
}
