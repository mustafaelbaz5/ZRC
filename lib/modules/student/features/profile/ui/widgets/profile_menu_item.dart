import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(20),
            vertical: responsiveHeight(16),
          ),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(responsiveWidth(10)),
                decoration: BoxDecoration(
                  color: context.customColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(responsiveWidth(12)),
                ),
                child: Icon(
                  icon,
                  size: responsiveWidth(22),
                  color: context.customColors.textSecondary,
                ),
              ),
              horizontalSpacing(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: AppTextStyles.font14Bold.copyWith(
                        color: context.customColors.textPrimary,
                      ),
                    ),
                    verticalSpacing(4),
                    Text(
                      subtitle,
                      style: AppTextStyles.font13Regular.copyWith(
                        fontSize: responsiveWidth(12),
                        color: context.customColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else
                Icon(
                  Icons.arrow_forward_ios,
                  size: responsiveWidth(16),
                  color: context.customColors.textSecondary.withAlpha(
                    100,
                  ), // Adjust alpha as needed
                  // Or use AppColors.grey400 if available
                ),
            ],
          ),
        ),
      ),
    );
  }
}
