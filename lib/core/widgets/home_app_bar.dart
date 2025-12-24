import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../config/constants.dart';
import '../extensions/context_extensions.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';
import '../utils/functions/string_fun.dart';
import '../utils/spacing.dart';
import 'notification_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.userName});

  final String userName;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: responsiveHeight(16),
        horizontal: responsiveWidth(16),
      ),
      decoration: BoxDecoration(
        color: context.customColors.surfaceVariant2,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: context.customColors.divider.withValues(alpha: 128),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Builder(
            builder: (final context) => IconButton(
              icon: const Icon(Icons.menu_rounded, color: AppColors.grey200),
              onPressed: () {
                Constants.scaffoldKey.currentState?.openDrawer();
              },
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('student_home.welcome'),
                  style: AppTextStyles.font14Regular.copyWith(
                    color: AppColors.grey200,
                  ),
                ),
                verticalSpacing(2),
                Text(
                  getFirstNWords(userName, wordCount: 2),
                  style: AppTextStyles.font20Bold.copyWith(
                    color: AppColors.grey0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const NotificationButton(),
        ],
      ),
    );
  }
}
