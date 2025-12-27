import 'package:flutter/material.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/custom_text_button.dart';

class InstructorCourseActionButtons extends StatelessWidget {
  const InstructorCourseActionButtons({
    super.key,
    this.onTap1,
    this.onTap2,
    this.isLoading = false,
    required this.onTap1Text,
    required this.onTap2Text,
  });
  final String onTap1Text;
  final String onTap2Text;
  final void Function()? onTap1;
  final void Function()? onTap2;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsiveWidth(20)),
      decoration: BoxDecoration(
        // color:
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomTextButton(
                size: CustomButtonSize.medium,
                style: CustomButtonStyle.outlined,
                text: onTap1Text,
                prefixIcon: const Icon(Icons.drafts_outlined),
                onPressed: onTap1,

                textStyle: AppTextStyles.font14Regular.copyWith(
                  color: context.customColors.textPrimary,
                ),
              ),
            ),
            horizontalSpacing(16),
            Expanded(
              flex: 3,
              child: CustomTextButton(
                size: CustomButtonSize.medium,
                style: CustomButtonStyle.filled,
                text: onTap2Text,
                prefixIcon: const Icon(Icons.send_rounded),
                onPressed: onTap2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
