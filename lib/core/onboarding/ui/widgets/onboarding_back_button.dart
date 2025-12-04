import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/app_colors.dart';

class OnBoardingBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnBoardingBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.lightBlue,
          size: 20.sp,
        ),
      ),
    );
  }
}
