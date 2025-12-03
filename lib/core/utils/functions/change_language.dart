import 'package:arabic_roman_conv/arabic_roman_conv.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void changeLanguage(BuildContext context) {
  final current = context.locale;

  // Switch locale
  if (current.languageCode == 'en') {
    context.setLocale(const Locale('ar'));
  } else {
    context.setLocale(const Locale('en'));
  }
  (context as Element).markNeedsBuild();
}

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
