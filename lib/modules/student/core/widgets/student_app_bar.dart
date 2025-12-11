import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/app_assets.dart';
import 'package:zrc/core/utils/spacing.dart';

class StudentAppBar extends StatelessWidget {
  const StudentAppBar({
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
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
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
              style: AppTextStyles.font18Bold,
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
