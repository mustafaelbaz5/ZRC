import 'package:arabic_roman_conv/arabic_roman_conv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void switchLanguage(final BuildContext context) {
  final Locale current = context.locale;

  // Switch locale
  if (current.languageCode == 'en') {
    context.setLocale(const Locale('ar'));
  } else {
    context.setLocale(const Locale('en'));
  }
  (context as Element).markNeedsBuild();
}

/// Converts Arabic name to English
String changeNameToEn(final BuildContext context, final String nameAr) {
  if (context.locale.languageCode == 'en') {
    // Create an instance of ArabicRomanConv
    final ArabicRomanConv converter = ArabicRomanConv();
    final String nameEn = converter.romanized(nameAr);
    return nameEn;
  } else {
    // Keep Arabic
    return nameAr;
  }
}

/// Checks if the app language is Arabic
bool isAppLanguageArabic(final BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'ar';
}

/// Translates text to Arabic
Future<String> translateToArabic(final String text) async {
  final GoogleTranslator translator = GoogleTranslator();
  final Translation translation = await translator.translate(text, to: 'ar');
  return translation.text;
}
