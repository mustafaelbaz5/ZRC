import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/core/widgets/horizontal_filter_chips.dart';

import '../../../home/data/model/category_model.dart';

class AllCoursesFilterListView extends StatefulWidget {
  const AllCoursesFilterListView({super.key});

  @override
  State<AllCoursesFilterListView> createState() =>
      _AllCoursesFilterListViewState();
}

class _AllCoursesFilterListViewState extends State<AllCoursesFilterListView> {
  int selectedIndex = 0;
  final List<CategoryModel> categories = CategoryModel.categories;

  @override
  Widget build(final BuildContext context) {
    return HorizontalFilterChips(
      height: responsiveHeight(40),
      items: categories.map((final e) => e.title).toList(),
      selectedIndex: selectedIndex,
      onChanged: (final index) {
        setState(() => selectedIndex = index);
      },
    );
  }
}
