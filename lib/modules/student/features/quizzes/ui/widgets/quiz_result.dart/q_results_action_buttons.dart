import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/extensions/navigation.dart';
import '../../../../../../../core/router/routes.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../data/model/quiz_model.dart';

class QResultsActionButtons extends StatelessWidget {
  final bool isPassed;
  final bool canRetake;
  final QuizModel quiz;

  const QResultsActionButtons({
    super.key,
    required this.isPassed,
    required this.canRetake,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (canRetake)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate back to quiz details to retake
                  context.pushReplacementNamed(
                    Routes.studentQuizDetailedScreen,
                    arguments: {'quiz': quiz},
                  );
                },
                icon: Icon(Icons.replay, size: 20.sp),
                label: Text(
                  'finished'.toUpperCase(),
                  style: AppTextStyles.font16WhiteRegular(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightBlue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  elevation: 4,
                ),
              ),
            ),
          if (canRetake) SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.studentScaffold,
                  (route) => false,
                  arguments: {
                    'navigationKey': GlobalKey<CurvedNavigationBarState>(),
                  },
                );
              },
              icon: Icon(Icons.home_outlined, size: 20.sp),
              label: Text(
                'Back to Home',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey[700],
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                side: BorderSide(color: Colors.grey[300]!, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
