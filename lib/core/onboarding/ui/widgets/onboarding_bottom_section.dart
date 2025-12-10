import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/spacing.dart';
import '../../../widgets/custom_text_button.dart';
import 'onboarding_back_button.dart';
import 'page_indicator.dart';

class OnBoardingBottomSection extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final bool isLastPage;
  final bool canGoBack;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnBoardingBottomSection({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.isLastPage,
    required this.canGoBack,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: <Widget>[
          PageIndicator(currentPage: currentPage, pageCount: pageCount),
          verticalSpacing(32.h),
          _buildActionButtons(),
          verticalSpacing(24.h),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: <Widget>[
        if (canGoBack)
          OnBoardingBackButton(onPressed: onBack)
        else
          SizedBox(width: 56.w),
        horizontalSpacing(12.w),
        Expanded(
          child: CustomTextButton(
            buttonText: isLastPage
                ? 'onboarding.button_get_started'.tr()
                : 'onboarding.button_next'.tr(),
            onPressed: onNext,
            buttonHeight: 56.h,
            buttonWidth: double.infinity,
            borderRadius: 12.r,
          ),
        ),
      ],
    );
  }
}
