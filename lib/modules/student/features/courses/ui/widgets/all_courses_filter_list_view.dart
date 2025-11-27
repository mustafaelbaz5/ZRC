import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/all_courses_filter_list_view_item.dart';
import 'package:zrc/modules/student/features/home/data/model/category_model.dart';

class AllCoursesFilterListView extends StatefulWidget {
  const AllCoursesFilterListView({super.key});

  @override
  State<AllCoursesFilterListView> createState() =>
      _AllCoursesFilterListViewState();
}

class _AllCoursesFilterListViewState extends State<AllCoursesFilterListView> {
  int selectedIndex = 0;
  final categories = CategoryModel.categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
