import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/modules/student/features/quizzes/data/model/quiz_model.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quiz_result.dart/q_results_info_row.dart';

class QResultsQuizInfoCard extends StatelessWidget {
  final QuizModel quiz;

  const QResultsQuizInfoCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.quiz_outlined, size: 20.sp, color: Colors.blue[700]),
              SizedBox(width: 8.w),
              Text(
                'Quiz Details',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          QResultsInfoRow(label: 'Quiz Title', value: quiz.title),
          SizedBox(height: 10.h),
          QResultsInfoRow(label: 'Subject', value: quiz.subject),
          SizedBox(height: 10.h),
          QResultsInfoRow(label: 'Instructor', value: quiz.instructorName),
        ],
      ),
    );
  }
}
