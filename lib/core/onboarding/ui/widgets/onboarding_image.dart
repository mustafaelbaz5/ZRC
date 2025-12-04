import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingImage extends StatelessWidget {
  final String imagePath;

  const OnBoardingImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'onboarding_$imagePath',
      child: Container(
        width: double.infinity,
        height: 300.h,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Colors.grey[50],
        ),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
