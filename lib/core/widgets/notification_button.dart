import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/app_assets.dart';
import 'package:zrc/core/utils/spacing.dart';

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
            color: context.customColors.border.withAlpha(100),
            shape: BoxShape.circle,
            border: Border.all(
              color: context.customColors.divider.withAlpha(100),
              width: 1,
            ),
          ),
          child: SvgPicture.asset(
            AppAssets.notificationIcon,
            width: responsiveWidth(20),
            height: responsiveWidth(20),
          ),
        ),
      ),
    );
  }
}
