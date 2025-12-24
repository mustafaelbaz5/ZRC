import 'package:arabic_roman_conv/arabic_roman_conv.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import '../../extensions/context_extensions.dart';

/// Get first {wordCount} words from a string
String getFirstNWords(final String fullName, {final int wordCount = 3}) {
  if (fullName.isEmpty) return '';
  final List<String> words = fullName.split(' ');
  if (words.length <= wordCount) return fullName;
  return words.sublist(0, wordCount).join(' ');
}

/// Converts Arabic name to English
String convertNamesToEn(final BuildContext context, final String nameAr) {
  if (!context.isArabic) {
    // Create an instance of ArabicRomanConv
    final ArabicRomanConv converter = ArabicRomanConv();
    final String nameEn = converter.romanized(nameAr);
    return nameEn;
  } else {
    // Keep Arabic
    return nameAr;
  }
}

/// Translates text to Arabic
Future<String> translateToArabic(final String text) async {
  final GoogleTranslator translator = GoogleTranslator();
  final Translation translation = await translator.translate(text, to: 'ar');
  return translation.text;
}

String getYoutubeThumbnail(final String url) {
  final uri = Uri.parse(url);

  if (uri.host.contains('youtu.be')) {
    return 'https://img.youtube.com/vi/${uri.pathSegments.first}/hqdefault.jpg';
  }

  return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/hqdefault.jpg';
}
