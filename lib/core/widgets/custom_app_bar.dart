import 'package:flutter/material.dart';
import '../config/constants.dart';
import '../extensions/context_extensions.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';
import '../utils/spacing.dart';
import 'notification_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showNotificationIcon = true,
    this.backgroundColor,
  });

  final String title;
  final bool showBackButton;
  final bool showNotificationIcon;
  final Color? backgroundColor;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(8),
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.customColors.surfaceVariant2,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(responsiveWidth(20)),
        ),
        boxShadow: [
          BoxShadow(
            color: context.customColors.divider.withAlpha(64),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.grey0,
              ),
              onPressed: () => context.pop(),
            )
          else
            Builder(
              builder: (final context) => IconButton(
                icon: const Icon(Icons.menu_rounded, color: AppColors.grey0),
                onPressed: () {
                  Constants.scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),

          horizontalSpacing(12),

          Expanded(
            child: Text(
              title,
              style: AppTextStyles.font18Bold.copyWith(color: AppColors.grey0),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          horizontalSpacing(12),

          showNotificationIcon
              ? const NotificationButton()
              : horizontalSpacing(48),
        ],
      ),
    );
  }
}
