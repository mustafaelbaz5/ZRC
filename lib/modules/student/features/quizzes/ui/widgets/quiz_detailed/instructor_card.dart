import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';

class InstructorCard extends StatelessWidget {
  final QuizModel quiz;

  const InstructorCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.blue[100],
            child: quiz.instructorAvatar != null
                ? null
                : Icon(Icons.person, size: 28.sp, color: Colors.blue[700]),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Instructor', style: AppTextStyles.font13greyRegular),
                verticalSpacing(4),
                Text(quiz.instructorName, style: AppTextStyles.font16BlackBold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
