import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hizb_ul_bahr/screens/Homescreen%20Widgets/read_now_button.dart';

class BookHeroCard extends StatelessWidget {
  const BookHeroCard({super.key, required this.onTap});

  final VoidCallback onTap;

  static const Color _darkGreen = Color(0xFF032F26);
  static const Color _green = Color(0xFF064A3B);
  static const Color _gold = Color(0xFFD4A548);
  static const Color _lightGold = Color(0xFFF1D58A);
  static const Color _cream = Color(0xFFFFFCF2);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [_darkGreen, _green, Color(0xFF075943)],
          ),
          border: Border.all(color: _gold.withValues(alpha: 0.65), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.20),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Stack(
            children: [
              Positioned(top: -40, right: -40, child: _circle(120, 0.07)),
              Positioned(bottom: -45, left: -40, child: _circle(115, 0.06)),
              Positioned(
                top: 45,
                left: -15,
                child: Transform.rotate(angle: math.pi / 4, child: _square(30)),
              ),
              Positioned(
                bottom: 40,
                right: -15,
                child: Transform.rotate(angle: math.pi / 4, child: _square(30)),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 13),
                child: Column(
                  children: [
                    _header(),

                    const SizedBox(height: 8),

                    _bookSeal(),

                    const SizedBox(height: 5),

                    _title(),

                    const SizedBox(height: 6),

                    _description(),

                    const SizedBox(height: 7),

                    _features(),

                    const SizedBox(height: 9),

                    _goldDivider(),

                    const SizedBox(height: 9),

                    ReadNowButton(onTap: onTap),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.08),
            shape: BoxShape.circle,
            border: Border.all(color: _gold.withValues(alpha: 0.35)),
          ),
          child: const Icon(
            Icons.menu_book_rounded,
            color: _lightGold,
            size: 19,
          ),
        ),

        const SizedBox(width: 8),

        const Expanded(
          child: Text(
            'روحانی کتاب',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: _lightGold,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        _tinyDecoration(),
        const SizedBox(width: 4),
        _tinyDecoration(),
        const SizedBox(width: 4),
        _tinyDecoration(),
      ],
    );
  }

  Widget _bookSeal() {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _cream,
        border: Border.all(color: _gold, width: 2),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.18),
            blurRadius: 12,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _gold.withValues(alpha: 0.45),
                width: 1,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_book_rounded, color: _green, size: 25),
              const SizedBox(height: 1),
              Container(width: 22, height: 1, color: _gold),
            ],
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Column(
      children: [
        const Text(
          'کتاب الذکر والدعاء',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Scheherazade',
            color: _cream,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            height: 1.15,
          ),
        ),

        const SizedBox(height: 0),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _shortLine(),
            const SizedBox(width: 5),
            const Icon(Icons.auto_awesome, color: _lightGold, size: 9),
            const SizedBox(width: 5),
            _shortLine(),
          ],
        ),
      ],
    );
  }

  Widget _description() {
    return Column(
      children: [
        Text(
          'مکمل متن اور اردو ترجمہ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _cream.withValues(alpha: 0.88),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          'روزانہ تلاوت اور روحانی سکون کے لیے',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _cream.withValues(alpha: 0.58),
            fontSize: 10.5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _features() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _feature(Icons.menu_book_outlined, 'مکمل کتاب'),

        _featureDivider(),

        _feature(Icons.translate_rounded, 'ترجمہ'),

        _featureDivider(),

        _feature(Icons.phone_android_rounded, 'آف لائن'),
      ],
    );
  }

  Widget _feature(IconData icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: _lightGold),

        const SizedBox(height: 2),

        Text(
          text,
          style: TextStyle(
            color: _cream.withValues(alpha: 0.72),
            fontSize: 9.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _featureDivider() {
    return Container(
      width: 1,
      height: 21,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      color: _gold.withValues(alpha: 0.25),
    );
  }

  Widget _goldDivider() {
    return Row(
      children: [
        Expanded(child: _gradientLine()),

        const SizedBox(width: 6),

        Transform.rotate(
          angle: math.pi / 4,
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(color: _gold),
          ),
        ),

        const SizedBox(width: 6),

        Expanded(child: _gradientLine()),
      ],
    );
  }

  Widget _gradientLine() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, _gold.withValues(alpha: 0.65)],
        ),
      ),
    );
  }

  Widget _tinyDecoration() {
    return Transform.rotate(
      angle: math.pi / 4,
      child: Container(
        width: 5,
        height: 5,
        decoration: BoxDecoration(
          border: Border.all(color: _gold.withValues(alpha: 0.75), width: 1),
        ),
      ),
    );
  }

  Widget _circle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: _gold.withValues(alpha: opacity), width: 1),
      ),
    );
  }

  Widget _square(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: _gold.withValues(alpha: 0.07), width: 1),
      ),
    );
  }

  Widget _shortLine() {
    return Container(width: 18, height: 1, color: _gold.withValues(alpha: 0.7));
  }
}
