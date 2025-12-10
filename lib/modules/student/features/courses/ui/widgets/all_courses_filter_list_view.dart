import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/model/category_model.dart';
import 'all_courses_filter_list_view_item.dart';

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
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (final BuildContext context, final int index) {
          return AllCoursesFilterListViewItem(
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() => selectedIndex = index);
            },

            title: categories[index].title,
          );
        },
      ),
    );
  }
}
