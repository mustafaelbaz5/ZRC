import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/app_colors.dart';
import '../utils/app_assets.dart';
import '../utils/spacing.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.grey300.withAlpha(100),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grey200.withAlpha(100),
              width: 1,
            ),
          ),
          child: SvgPicture.asset(
            AppAssets.notificationIcon,
            width: responsiveWidth(16),
            height: responsiveWidth(16),
            colorFilter: const ColorFilter.mode(
              AppColors.grey0,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
