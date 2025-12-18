import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/notification_button.dart';

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
            color: modesColors.divider,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
        color: modesColors.background,
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
                      color: modesColors.textSecondary,
                    ),
                  ),
                  verticalSpacing(6),
                  Text(
                    "\t${getFirstNWords(userName, wordCount: 2)}",
                    style: AppTextStyles.font20Bold.copyWith(
                      color: modesColors.textPrimary,
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
