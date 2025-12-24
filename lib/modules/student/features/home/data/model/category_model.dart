import 'package:easy_localization/easy_localization.dart';

import '../../../../../../core/utils/app_assets.dart';

class CategoryModel {
  final String icon;
  final String titleKey;

  CategoryModel({required this.titleKey, required this.icon});

  String get title => tr(titleKey);

  static List<CategoryModel> categories = <CategoryModel>[
    CategoryModel(
      titleKey: 'student_home.categories.programming',
      icon: AppAssets.softWareIcon,
    ),
    CategoryModel(
      titleKey: 'student_home.categories.hardware',
      icon: AppAssets.hardWareIcon,
    ),
    CategoryModel(
      titleKey: 'student_home.categories.mechanical_design',
      icon: AppAssets.mechanicalDesignIcone,
    ),
    CategoryModel(
      titleKey: 'student_home.categories.3d_design',
      icon: AppAssets.categoryOtherIcon,
    ),
    CategoryModel(
      titleKey: 'student_home.categories.graphic_design',
      icon: AppAssets.categoryOtherIcon,
    ),
    CategoryModel(
      titleKey: 'student_home.categories.others',
      icon: AppAssets.categoryOtherIcon,
    ),
  ];
}
