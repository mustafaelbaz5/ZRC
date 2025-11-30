import 'package:flutter/material.dart';
import 'package:zrc/modules/student/core/widgets/custom_app_bar.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quizzes_filter_row.dart';
import 'package:zrc/modules/student/features/quizzes/ui/widgets/quizzes_list_view.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  String selectedFilter = 'All';

  void onFilterChanged(String newFilter) {
    setState(() {
      selectedFilter = newFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(title: "Quizzes"),

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
