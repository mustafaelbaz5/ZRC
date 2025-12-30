import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/custom_text_button.dart';

class CustomActionButtons extends StatelessWidget {
  const CustomActionButtons({
    super.key,
    required this.onTap1Text,
    required this.onTap2Text,
    this.onTap1,
    this.onTap2,
    this.isLoading = false,
  });

  final String onTap1Text;
  final String onTap2Text;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Material(
      elevation: 8,
      color: colors.surface,
      borderRadius: BorderRadius.circular(responsiveRadius(12)),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(20),
            vertical: responsiveHeight(14),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomTextButton(
                  size: CustomButtonSize.small,
                  style: CustomButtonStyle.outlined,
                  onPressed: isLoading ? null : onTap1,
                  prefixIcon: Icon(
                    Icons.drafts_outlined,
                    size: responsiveRadius(18),
                  ),
                  text: onTap1Text,
                  textStyle: AppTextStyles.font14Regular.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),

              horizontalSpacing(14),

              Expanded(
                flex: 4,
                child: CustomTextButton(
                  size: CustomButtonSize.small,
                  style: CustomButtonStyle.filled,
                  onPressed: isLoading ? null : onTap2,
                  prefixIcon: isLoading
                      ? SizedBox(
                          width: responsiveWidth(18),
                          height: responsiveHeight(18),
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Icon(Icons.send_rounded, size: responsiveRadius(18)),
                  text: onTap2Text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
