import 'package:flutter/material.dart';
import 'package:hizb_ul_bahr/screens/Homescreen%20Widgets/dotPattern_background.dart';
import 'package:share_plus/share_plus.dart';
import 'package:hizb_ul_bahr/core/app_constants.dart';
import 'package:hizb_ul_bahr/features/pdfbook/pdf_book_page.dart';
import 'package:hizb_ul_bahr/screens/Homescreen%20Widgets/animated_in.dart';
import 'package:hizb_ul_bahr/screens/Homescreen%20Widgets/book_hero.dart';
import 'package:hizb_ul_bahr/screens/Homescreen%20Widgets/info.dart';
import 'package:hizb_ul_bahr/widgets/home_header/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _visible = true);
      }
    });
  }

  void _openBook() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const PdfBookPage(
          assetPath: AppConstants.bookAsset,
          title: AppConstants.appName,
        ),
      ),
    );
  }

  Future<void> _shareApp() async {
    final box = context.findRenderObject() as RenderBox?;

    await SharePlus.instance.share(
      ShareParams(
        text: AppConstants.shareMessage,
        subject: AppConstants.appName,
        sharePositionOrigin: box != null
            ? box.localToGlobal(Offset.zero) & box.size
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF032F26),
      body: IslamicPatternBackground(
        color: const Color(0xFF032F26),
        patternOpacity: 0.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeader(),

              Transform.translate(
                offset: const Offset(0, -14),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      AnimatedIn(
                        visible: _visible,
                        child: BookHeroCard(onTap: _openBook),
                      ),

                      const SizedBox(height: 18),

                      AnimatedIn(
                        visible: _visible,
                        delayMs: 120,
                        child: InfoStrip(onShare: _shareApp),
                      ),

                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(height: 14 + MediaQuery.of(context).padding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
