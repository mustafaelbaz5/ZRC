import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.accentBlue.withValues(alpha: 0.1),
            colors.accentBlue.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colors.accentBlue.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: colors.accentBlue.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: colors.accentBlue.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: responsiveRadius(26),
              backgroundColor: Colors.transparent,
              backgroundImage: const AssetImage(AppAssets.onBoardingBanner2),
              onBackgroundImageError: (_, final _) {},
              child: Icon(
                Icons.person_rounded,
                size: responsiveRadius(12),
                color: colors.accentBlue,
              ),
            ),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instructor',
                  style: AppTextStyles.font18Bold.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
                verticalSpacing(4),
                Text(
                  'Dashboard',
                  style: AppTextStyles.font14Regular.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
