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
            label: 'All',
            isSelected: selectedFilter == 'All',
            onTap: () => onFilterChanged('All'),
          ),
          SizedBox(width: 8.w),
          QuizzesFilterChip(
            label: 'Pending',
            isSelected: selectedFilter == 'Pending',
            onTap: () => onFilterChanged('Pending'),
          ),
          SizedBox(width: 8.w),
          QuizzesFilterChip(
            label: 'Completed',
            isSelected: selectedFilter == 'Completed',
            onTap: () => onFilterChanged('Completed'),
          ),
        ],
      ),
    );
  }
}
