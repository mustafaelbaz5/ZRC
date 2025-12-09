import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';
import 'widgets/quizzes_filter_row.dart';
import 'widgets/quizzes_list_view.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = tr('student_quizzes.filters.all');
  }

  void onFilterChanged(final String newFilter) {
    setState(() {
      selectedFilter = newFilter;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          CustomAppBar(title: tr('student_quizzes.screen_title')),

          // Filter Tabs
          QuizzesFilterRow(
            selectedFilter: selectedFilter,
            onFilterChanged: onFilterChanged,
          ),

          // Quizzes List
          Expanded(child: QuizzesListView(filter: selectedFilter)),
        ],
      ),
    );
  }
}
