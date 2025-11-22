import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/navigation.dart';
import '../../router/routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';
import '../../utils/app_assets.dart';
import '../../utils/spacing.dart';
import '../../widgets/custom_text_button.dart';
import '../data/models/on_boarding_page_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnBoardingPageModel> onboardingPages = [
    OnBoardingPageModel(
      image: AppAssets.onBoardingBanner1,
      title: 'Welcome to ZRC',
      subtitle: 'ZNU Robotics Community',
    ),
    OnBoardingPageModel(
      image: AppAssets.onBoardingBanner2,
      title: 'Step into a World of Learning Excellence',
      subtitle: 'Join workshops and projects',
    ),
    OnBoardingPageModel(
      image: AppAssets.onBoardingBanner3,
      title: 'Explore Endless Possibilities',
      subtitle: 'Collaborate with peers and mentors',
    ),
    OnBoardingPageModel(
      image: AppAssets.onBoardingBanner4,
      title: 'Start Your SkillUp Journey Today',
      subtitle: 'Unlock a World of Possibilities',
    ),
  ];

  void _nextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to Login using your navigation extension
      context.pushReplacementNamed(Routes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  final page = onboardingPages[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 320.h,
                          child: Image.asset(page.image, fit: BoxFit.contain),
                        ),
                        verticalSpacing(40.h),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font32BlackBold.copyWith(
                            fontSize: 32.sp,
                          ),
                        ),
                        verticalSpacing(12.h),
                        Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.font18GreyRegular.copyWith(
                            fontSize: 18.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Page indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingPages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  width: _currentPage == index ? 20.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.lightBlue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),

            verticalSpacing(40.h),

            // Next / Get Started Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomTextButton(
                buttonText: _currentPage == onboardingPages.length - 1
                    ? 'Get Started'
                    : 'Next',
                onPressed: _nextPage,
                buttonHeight: 56.h,
                buttonWidth: double.infinity,
                borderRadius: 12.r,
              ),
            ),

            verticalSpacing(20.h),
          ],
        ),
      ),
    );
  }
}
