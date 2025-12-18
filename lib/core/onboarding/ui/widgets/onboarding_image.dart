import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';

class OnBoardingImage extends StatelessWidget {
  final String imagePath;

  const OnBoardingImage({super.key, required this.imagePath});

  @override
  Widget build(final BuildContext context) {
    return Hero(
      tag: 'onboarding_$imagePath',
      child: Container(
        width: double.infinity,
        height: 350.h,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: context.customColors.surface,
        ),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
