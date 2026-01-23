import 'package:easy_localization/easy_localization.dart';

import '../utils/app_assets.dart';

class CategoryModel {
  final String icon;
  final String titleKey;

  CategoryModel({required this.titleKey, required this.icon});

  String get title => tr(titleKey);

  static List<CategoryModel> categories = <CategoryModel>[
    CategoryModel(titleKey: 'programming', icon: AppAssets.softWareIcon),
    CategoryModel(titleKey: 'Hardware', icon: AppAssets.hardWareIcon),
    CategoryModel(
      titleKey: 'Mechanical design',
      icon: AppAssets.mechanicalDesignIcone,
    ),
    CategoryModel(titleKey: '3D design', icon: AppAssets.categoryOtherIcon),
    CategoryModel(
      titleKey: 'Graphic design',
      icon: AppAssets.categoryOtherIcon,
    ),
    CategoryModel(titleKey: 'Others', icon: AppAssets.categoryOtherIcon),
  ];
}
