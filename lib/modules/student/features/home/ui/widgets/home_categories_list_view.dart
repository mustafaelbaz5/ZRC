import 'package:flutter/material.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/home/data/model/category_model.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/home_categories_list_view_item.dart';

class HomeCategoriesListView extends StatefulWidget {
  const HomeCategoriesListView({super.key});

  @override
  State<HomeCategoriesListView> createState() => _HomeCategoriesListViewState();
}

class _HomeCategoriesListViewState extends State<HomeCategoriesListView> {
  int selectedIndex = 0;
  final List<CategoryModel> categories = CategoryModel.categories;
  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: responsiveHeight(120),
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (final BuildContext context, final int index) {
          return HomeCategoriesListViewItem(
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
