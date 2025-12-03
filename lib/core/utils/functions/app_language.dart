import 'package:arabic_roman_conv/arabic_roman_conv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void switchLanguage(BuildContext context) {
  final current = context.locale;

  // Switch locale
  if (current.languageCode == 'en') {
    context.setLocale(const Locale('ar'));
  } else {
    context.setLocale(const Locale('en'));
  }
  (context as Element).markNeedsBuild();
}

/// Converts Arabic name to English
String changeNameToEn(BuildContext context, String nameAr) {
  if (context.locale.languageCode == 'en') {
    // Create an instance of ArabicRomanConv
    final converter = ArabicRomanConv();
    final nameEn = converter.romanized(nameAr);
    return nameEn;
  } else {
    // Keep Arabic
    return nameAr;
  }
}

/// Checks if the app language is Arabic
bool isAppLanguageArabic(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'ar';
}

/// Translates text to Arabic
Future<String> translateToArabic(String text) async {
  final translator = GoogleTranslator();
  var translation = await translator.translate(text, to: 'ar');
  return translation.text;
}
