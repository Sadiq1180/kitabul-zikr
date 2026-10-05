import 'dart:ui';

import 'package:hizb_ul_bahr/core/app_colors.dart';

class AppConstants {
  AppConstants._();

  static const appName = 'کتاب الذکر والدعاء';
  static const arabicNameFont = 'Amiri';
  static const String apkDownloadUrl =
      'https://drive.google.com/file/d/1rpXgSrv2Snbu4E1Ve4iuuR8LJ0tbfWse/view?usp=drive_link';

  static const String shareMessage =
      'حزب البحر پڑھنے کے لیے یہ ایپ ڈاؤن لوڈ کریں. 🌙\n\nڈاؤن لوڈ لنک:\n$apkDownloadUrl';

  // Change this if your PDF file path is different.
  static const bookAsset = 'assets/hizb2.pdf';
}

/// Pages within this distance of the current page are allowed to load.
/// Pages further away stay as cheap placeholders (no render work queued).
const int kLoadWindow = 5;

/// Order in which neighbours are prefetched, as offsets from the current
/// PDF page. Both direct neighbours come first because the user can turn
/// either way; then we go outward. Kept symmetric with [kLoadWindow] so
/// backward flipping is prefetched just as eagerly as forward flipping.
const List<int> kPrefetchOffsets = [1, -1, 2, -2, 3, -3, 4, -4, 5, -5];

/// Colour palette for the reader. Values come from [AppColors] so the
/// reader always matches the rest of the app.
class ReaderColors {
  ReaderColors._();

  static const background = AppColors.primary; // deep blue
  static const appBar = AppColors.primaryLight;
  static const paper = Color(0xFFFFFCF5); // page stays warm white
  static const accent = AppColors.accent; // soft sand
  static const ink = AppColors.textMuted;
  static const desk = Color(0xFF0F1B2D); // dark navy behind the page
}
