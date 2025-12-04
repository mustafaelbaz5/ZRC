import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/extensions/navigation.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacing.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showNotificationIcon = true,
    this.showBackButton = false,
    this.route,
    this.onNotificationTap,
  });

  final String title;
  final bool showNotificationIcon;
  final bool showBackButton;
  final String? route;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // BACK BUTTON
          if (showBackButton)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (route != null) {
                    context.pushNamed(route!);
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.grey[800],
                    size: 20,
                  ),
                ),
              ),
            )
          else
            const SizedBox(width: 8),

          if (showBackButton) horizontalSpacing(12),

          // TITLE
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.font18BlackBold(),
              textAlign: showBackButton ? TextAlign.left : TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),

          if (showBackButton) horizontalSpacing(12),

          // NOTIFICATION ICON
          if (showNotificationIcon)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap:
                    onNotificationTap ??
                    () {
                      // Default notification action
                    },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!, width: 1),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.notificationIcon,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            )
          else
            const SizedBox(width: 8),
        ],
      ),
    );
  }
}
