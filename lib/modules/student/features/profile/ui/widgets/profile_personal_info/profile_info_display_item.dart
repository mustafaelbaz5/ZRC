import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class ProfileInfoDisplayItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool copyToClipboard;

  const ProfileInfoDisplayItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.copyToClipboard = false,
  });

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(14),
      ),
      child: Row(
        children: <Widget>[
          // Left Icon
          Container(
            padding: EdgeInsets.all(responsiveWidth(10)),
            decoration: BoxDecoration(
              color: context.customColors.infoContainer,
              borderRadius: BorderRadius.circular(responsiveWidth(12)),
            ),
            child: Icon(
              icon,
              size: responsiveWidth(20),
              color: context.customColors.accentBlue,
            ),
          ),

          horizontalSpacing(16),

          // Title + Value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: AppTextStyles.font13Regular.copyWith(
                    color: context.customColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpacing(4),
                Text(
                  value,
                  style: AppTextStyles.font14Bold.copyWith(
                    color: context.customColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),

          if (copyToClipboard)
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: value));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("student_profile.copy_to_clipboard".tr()),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(responsiveWidth(8)),
                decoration: BoxDecoration(
                  color: context.customColors.infoContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.copy,
                  size: responsiveWidth(18),
                  color: context.customColors.accentBlue,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
