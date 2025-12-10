import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class FillInBlankInput extends StatelessWidget {
  final dynamic answer;
  final Function(String) onChanged;

  const FillInBlankInput({
    super.key,
    required this.answer,
    required this.onChanged,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tr('student_quizzes.quiz_questions.question.your_answer'),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          verticalSpacing(14),
          TextField(
            onChanged: onChanged,
            controller: TextEditingController(text: answer?.toString() ?? ''),
            decoration: InputDecoration(
              hintText: tr(
                'student_quizzes.quiz_questions.question.answer_hint',
              ),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.blue[700]!, width: 2),
              ),
            ),
            style: AppTextStyles.font16BlackRegular(),
          ),
        ],
      ),
    );
  }
}
