import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/app_colors.dart';

class BackgroundShapes extends StatelessWidget {
  const BackgroundShapes({super.key});

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -100,
          left: -100,
          child: Container(
            width: 200.w,
            height: 200.w,
            decoration: BoxDecoration(
              color: AppColors.primary300.withValues(alpha: 50),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -120,
          right: -80,
          child: Container(
            width: 250.w,
            height: 250.w,
            decoration: BoxDecoration(
              color: AppColors.primary300.withValues(alpha: 50),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: -60,
          child: Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              color: AppColors.primary300.withValues(alpha: 30),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
