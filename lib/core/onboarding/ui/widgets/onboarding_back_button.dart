import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';

class OnBoardingBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnBoardingBackButton({super.key, required this.onPressed});

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: context.customColors.containerColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: context.customColors.borderColor, width: 1),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: context.customColors.onContainerPrimary,
          size: 20.sp,
        ),
      ),
    );
  }
}
