import 'package:flutter/material.dart';

import '../../extensions/navigation.dart';
import '../../router/routes.dart';
import '../../utils/app_assets.dart';
import '../data/models/on_boarding_page_model.dart';
import 'widgets/onboarding_bottom_section.dart';
import 'widgets/onboarding_content.dart';
import 'widgets/onboarding_top_bar.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static final List<OnBoardingPageModel> _onboardingPages = [
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

  bool get _isLastPage => _currentPage == _onboardingPages.length - 1;
  bool get _canGoBack => _currentPage > 0 && !_isLastPage;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentPage = index);
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  void _navigateToLogin() {
    context.pushReplacementNamed(Routes.loginScreen);
  }

  void _handleNextAction() {
    if (_isLastPage) {
      _navigateToLogin();
    } else {
      _goToNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            OnBoardingTopBar(showSkip: !_isLastPage, onSkip: _navigateToLogin),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingPages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return OnBoardingContent(page: _onboardingPages[index]);
                },
              ),
            ),
            OnBoardingBottomSection(
              currentPage: _currentPage,
              pageCount: _onboardingPages.length,
              isLastPage: _isLastPage,
              canGoBack: _canGoBack,
              onNext: _handleNextAction,
              onBack: _goToPreviousPage,
            ),
          ],
        ),
      ),
    );
  }
}
