import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/spacing.dart';
import '../../data/models/on_boarding_page_model.dart';
import 'onboarding_image.dart';
import 'onboarding_text_content.dart';

class OnBoardingContent extends StatelessWidget {
  final OnBoardingPageModel page;

  const OnBoardingContent({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnBoardingImage(imagePath: page.image),
          verticalSpacing(48.h),
          OnBoardingTextContent(title: page.title, subtitle: page.subtitle),
        ],
      ),
    );
  }
}
