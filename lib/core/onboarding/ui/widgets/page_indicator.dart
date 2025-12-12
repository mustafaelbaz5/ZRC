import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (final int index) => _PageIndicatorDot(isActive: currentPage == index),
      ),
    );
  }
}

class _PageIndicatorDot extends StatelessWidget {
  final bool isActive;

  const _PageIndicatorDot({required this.isActive});

  @override
  Widget build(final BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: isActive ? 32.w : 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: isActive
            ? context.customColors.onContainerPrimary
            : context.customColors.borderColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
