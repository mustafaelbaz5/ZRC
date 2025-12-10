import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/category_model.dart';
import 'categories_list_view_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0;
  final List<CategoryModel> categories = CategoryModel.categories;
  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (final BuildContext context, final int index) {
          return CategoriesListViewItem(
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() => selectedIndex = index);
            },
            icon: categories[index].icon,
            title: categories[index].title,
          );
        },
      ),
    );
  }
}
