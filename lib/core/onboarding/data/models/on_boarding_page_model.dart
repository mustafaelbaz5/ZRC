import '../../../utils/app_assets.dart';

class OnBoardingPageModel {
  final String image;
  final String title;
  final String subtitle;

  OnBoardingPageModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<OnBoardingPageModel> onboardingPages = <OnBoardingPageModel>[
  OnBoardingPageModel(
    image: AppAssets.onBoardingBanner1,
    title: 'onboarding.title1',
    subtitle: 'onboarding.subtitle1',
  ),
  OnBoardingPageModel(
    image: AppAssets.onBoardingBanner2,
    title: 'onboarding.title2',
    subtitle: 'onboarding.subtitle2',
  ),
  OnBoardingPageModel(
    image: AppAssets.onBoardingBanner3,
    title: 'onboarding.title3',
    subtitle: 'onboarding.subtitle3',
  ),
  OnBoardingPageModel(
    image: AppAssets.onBoardingBanner4,
    title: 'onboarding.title4',
    subtitle: 'onboarding.subtitle4',
  ),
];
