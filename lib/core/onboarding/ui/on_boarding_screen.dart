import 'package:flutter/material.dart';
import 'package:zrc/core/utils/functions/change_language.dart';

import '../../extensions/navigation.dart';
import '../../router/routes.dart';
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

  bool get _isLastPage => _currentPage == onboardingPages.length - 1;
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

  void _onChangeLanguage() {
    changeLanguage(context);
    setState(() {});
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
            OnBoardingTopBar(
              showSkip: !_isLastPage,
              onSkip: _navigateToLogin,
              onChangeLanguage: _onChangeLanguage,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return OnBoardingContent(page: onboardingPages[index]);
                },
              ),
            ),
            OnBoardingBottomSection(
              currentPage: _currentPage,
              pageCount: onboardingPages.length,
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
