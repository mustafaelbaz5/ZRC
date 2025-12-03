import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/app_text_styles.dart';
import '../../../utils/spacing.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: AppTextStyles.font32BlackBold().copyWith(fontSize: 32.sp),
        ),
        verticalSpacing(8),
        Text(
          'Login with your university email and password',
          textAlign: TextAlign.center,
          style: AppTextStyles.font16GreyRegular(),
        ),
      ],
    );
  }
}
