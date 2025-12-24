import '../../../../../../core/utils/app_assets.dart';

class HeaderItemModel {
  final String titleKey;
  final String image;

  const HeaderItemModel({required this.titleKey, required this.image});
}

final List<HeaderItemModel> headerItems = [
  const HeaderItemModel(
    titleKey: 'student_home.header_title',
    image: AppAssets.onBoardingBanner2,
  ),
  const HeaderItemModel(
    titleKey: 'student_home.header_title',
    image: AppAssets.onBoardingBanner3,
  ),
  const HeaderItemModel(
    titleKey: 'student_home.header_title',
    image: AppAssets.onBoardingBanner1,
  ),
  const HeaderItemModel(
    titleKey: 'student_home.header_title',
    image: AppAssets.onBoardingBanner1,
  ),
  const HeaderItemModel(
    titleKey: 'student_home.header_title',
    image: AppAssets.onBoardingBanner1,
  ),
  const HeaderItemModel(
    titleKey: 'student_home.header_title',
    image: AppAssets.onBoardingBanner1,
  ),
];
