import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';

import '../../../themes/app_text_styles.dart';
import '../../../utils/spacing.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(20)),
      child: Column(
        children: <Widget>[
          Text(
            'login.title'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.font32Bold,
          ),
          verticalSpacing(10),
          Text(
            'login.subtitle'.tr(),
            textAlign: TextAlign.center,
            style: AppTextStyles.font16Regular.copyWith(
              color: context.customColors.textPrimary.withAlpha(128),
            ),
          ),
        ],
      ),
    );
  }
}
