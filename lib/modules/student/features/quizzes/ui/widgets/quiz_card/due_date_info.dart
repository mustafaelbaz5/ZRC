import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';

class DueDateInfo extends StatelessWidget {
  const DueDateInfo({super.key, required this.dueDate});
  final DateTime dueDate;

  String _formatDueDate() {
    final DateTime now = DateTime.now();
    final int difference = dueDate.difference(now).inDays;

    if (difference == 0) return tr('student_quizzes.due_date.due_today');
    if (difference == 1) return tr('student_quizzes.due_date.due_tomorrow');
    if (difference < 7) {
      return tr(
        'student_quizzes.due_date.due_in_days',
        namedArgs: <String, String>{'days': difference.toString()},
      );
    }
    return "${dueDate.day}/${dueDate.month}/${dueDate.year}";
  }

  Color _getColor() {
    final int difference = dueDate.difference(DateTime.now()).inDays;
    if (difference <= 1) return AppColors.error200;
    if (difference <= 3) return AppColors.warning200;
    return AppColors.grey500;
  }

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: _getColor().withAlpha(25),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.calendar_today_outlined, size: 14.sp, color: _getColor()),
          SizedBox(width: 6.w),
          Text(
            _formatDueDate(),
            style: AppTextStyles.font13Regular.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: _getColor(),
            ),
          ),
        ],
      ),
    );
  }
}
