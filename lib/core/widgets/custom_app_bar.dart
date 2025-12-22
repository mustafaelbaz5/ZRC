// core/widgets/custom_app_bar.dart
import 'package:flutter/material.dart';
import 'package:zrc/core/config/constants.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/notification_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showNotificationIcon = true,
  });

  final String title;
  final bool showBackButton;
  final bool showNotificationIcon;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(8),
      ),
      decoration: BoxDecoration(
        color: context.customColors.surfaceVariant2,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(responsiveWidth(20)),
        ),
        boxShadow: [
          BoxShadow(
            color: context.customColors.divider.withAlpha(128),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.of(context).pop(),
            )
          else
            Builder(
              builder: (final context) => IconButton(
                icon: const Icon(Icons.menu_rounded),
                onPressed: () {
                  Constants.scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),

          horizontalSpacing(12),

          Expanded(
            child: Text(
              title,
              style: AppTextStyles.font18Bold.copyWith(
                color: context.customColors.textPrimary,
              ),
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
