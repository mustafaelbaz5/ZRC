import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/widgets/filter_chip_item.dart';

class QuizzesFilterRow extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const QuizzesFilterRow({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(12),
      ),
      child: Row(
        children: <Widget>[
          FilterChipItem(
            label: tr('student_quizzes.filters.all'),
            isSelected: selectedFilter == tr('student_quizzes.filters.all'),
            onTap: () => onFilterChanged(tr('student_quizzes.filters.all')),
          ),
          horizontalSpacing(8),
          FilterChipItem(
            label: tr('student_quizzes.filters.pending'),
            isSelected: selectedFilter == tr('student_quizzes.filters.pending'),
            onTap: () => onFilterChanged(tr('student_quizzes.filters.pending')),
          ),
          horizontalSpacing(8),
          FilterChipItem(
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
