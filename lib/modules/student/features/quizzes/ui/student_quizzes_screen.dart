import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/modules/student/core/widgets/student_app_bar.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quizzes_filter_row.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quizzes_list_view.dart';

class StudentQuizzesScreen extends StatefulWidget {
  const StudentQuizzesScreen({super.key});

  @override
  State<StudentQuizzesScreen> createState() => _StudentQuizzesScreenState();
}

class _StudentQuizzesScreenState extends State<StudentQuizzesScreen> {
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
          StudentAppBar(title: tr('student_quizzes.screen_title')),

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
