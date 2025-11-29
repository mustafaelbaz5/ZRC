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
  });

  final String title;
  final bool showNotificationIcon;
  final bool showBackButton;
  final String? route; // Nullable now

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          horizontalSpacing(8),

          // BACK BUTTON (Only when available AND route is provided)
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                if (route != null) {
                  context.pushNamed(route!);
                }
              },
            )
          else
            const Spacer(),

          horizontalSpacing(8),

          Text(title, style: AppTextStyles.font20BlackBold),

          const Spacer(),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: showNotificationIcon
                ? SvgPicture.asset(
                    AppAssets.notificationIcon,
                    width: 20,
                    height: 20,
                  )
                : const SizedBox.shrink(),
          ),

          horizontalSpacing(16),
        ],
      ),
    );
  }
}
