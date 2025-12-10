import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';

class HomeHeadLineText extends StatelessWidget {
  const HomeHeadLineText({super.key, required this.title});

  final String title;

  @override
  Widget build(final BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverToBoxAdapter(
        child: Text(title, style: AppTextStyles.font20BlackBold()),
      ),
    );
  }
}
