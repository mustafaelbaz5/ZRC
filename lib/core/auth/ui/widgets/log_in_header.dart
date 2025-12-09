import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/app_text_styles.dart';
import '../../../utils/spacing.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'login.title'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.font32BlackBold().copyWith(fontSize: 32.sp),
        ),
        verticalSpacing(8),
        Text(
          'login.subtitle'.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.font16GreyRegular(),
        ),
      ],
    );
  }
}
