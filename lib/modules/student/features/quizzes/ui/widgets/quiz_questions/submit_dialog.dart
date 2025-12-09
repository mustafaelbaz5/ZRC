import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitDialog extends StatelessWidget {
  final int answered;
  final int total;
  const SubmitDialog({super.key, required this.answered, required this.total});

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: Text(
        tr('student_quizzes.quiz_questions.submit_dialog.title'),
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
      ),
      content: Text(
        tr(
          'student_quizzes.quiz_questions.submit_dialog.message',
          namedArgs: <String, String>{
            'answered': answered.toString(),
            'total': total.toString(),
          },
        ),
        style: TextStyle(fontSize: 14.sp),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            tr('student_quizzes.quiz_questions.submit_dialog.cancel'),
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            tr('student_quizzes.quiz_questions.submit_dialog.submit'),
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
