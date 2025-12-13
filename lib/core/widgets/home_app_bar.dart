import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';
import 'package:zrc/core/utils/spacing.dart';

import '../utils/app_assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.userName});

  final String userName;

  @override
  Widget build(final BuildContext context) {
    final modesColors = context.customColors;
    return Container(
      height: responsiveHeight(100),
      width: double.infinity,
      padding: EdgeInsets.only(
        top: responsiveHeight(24),
        left: responsiveWidth(16),
        right: responsiveWidth(16),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: modesColors.secondaryColor,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
        color: modesColors.backgroundColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr('student_home.welcome'),
                    style: AppTextStyles.font14Bold.copyWith(
                      color: modesColors.onContainerPrimary,
                    ),
                  ),
                  verticalSpacing(6),
                  Text(
                    "\t${getFirstNWords(userName, wordCount: 2)}",
                    style: AppTextStyles.font20Bold.copyWith(
                      color: modesColors.onContainerPrimary,
                    ),
                  ),
                ],
              ),
              const NotificationButton(),
            ],
          ),
        ],
      ),
    );
  }
}

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
            color: context.customColors.borderColor,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AppAssets.notificationIcon,
            width: responsiveHeight(20),
            height: responsiveHeight(20),
          ),
        ),
      ),
    );
  }
}
