import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class HomeHeadLineText extends StatelessWidget {
  const HomeHeadLineText({super.key, required this.title});

  final String title;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(20)),
      child: Text(title, style: AppTextStyles.font20Bold),
    );
  }
}
