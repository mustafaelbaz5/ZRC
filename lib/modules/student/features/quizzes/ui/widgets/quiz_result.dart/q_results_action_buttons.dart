import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../../core/utils/spacing.dart';

import '../../../../../../../core/router/routes.dart';
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
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: context.customColors.divider.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (canRetake)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate back to quiz details to retake
                  context.pushReplacementNamed(
                    Routes.studentQuizDetailedScreen,
                    arguments: <String, QuizModel>{'quiz': quiz},
                  );
                },
                icon: Icon(
                  Icons.replay,
                  size: 20.sp,
                  color: context.customColors.background,
                ),
                label: Text(
                  tr(
                    'student_quizzes.quiz_result.actions.finished',
                  ).toUpperCase(),
                  style: AppTextStyles.font16Regular.copyWith(
                    color: context.customColors.background,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.customColors.accentBlue,
                  foregroundColor: context.customColors.background,
                  padding: EdgeInsets.symmetric(vertical: responsiveHeight(16)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  elevation: 4,
                ),
              ),
            ),
          if (canRetake) verticalSpacing(12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.studentScaffold,
                  (final Route<dynamic> route) => false,
                  arguments: <String, GlobalKey<CurvedNavigationBarState>>{
                    'navigationKey': GlobalKey<CurvedNavigationBarState>(),
                  },
                );
              },
              icon: Icon(Icons.home_outlined, size: 20.sp),
              label: Text(
                tr('student_quizzes.quiz_result.actions.back_to_home'),
                style: AppTextStyles.font16Bold,
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: context.customColors.textSecondary,
                padding: EdgeInsets.symmetric(vertical: responsiveHeight(16)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                side: BorderSide(
                  color: context.customColors.divider,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
