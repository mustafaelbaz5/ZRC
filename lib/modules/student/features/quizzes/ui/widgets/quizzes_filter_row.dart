import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'quizzes_filter_chip.dart';

class QuizzesFilterRow extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const QuizzesFilterRow({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          QuizzesFilterChip(
            label: tr('student_quizzes.filters.all'),
            isSelected: selectedFilter == tr('student_quizzes.filters.all'),
            onTap: () => onFilterChanged(tr('student_quizzes.filters.all')),
          ),
          SizedBox(width: 8.w),
          QuizzesFilterChip(
            label: tr('student_quizzes.filters.pending'),
            isSelected: selectedFilter == tr('student_quizzes.filters.pending'),
            onTap: () => onFilterChanged(tr('student_quizzes.filters.pending')),
          ),
          SizedBox(width: 8.w),
          QuizzesFilterChip(
            label: tr('student_quizzes.filters.completed'),
            isSelected:
                selectedFilter == tr('student_quizzes.filters.completed'),
            onTap: () =>
                onFilterChanged(tr('student_quizzes.filters.completed')),
          ),
        ],
      ),
    );
  }
}
