import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/functions/app_setting_fun.dart';

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

  void _onPageChanged(final int index) {
    setState(() => _currentPage = index);
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  void _onChangeLanguage() {
    switchLanguage(context);
    setState(() {});
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  void _handleNextAction() {
    if (_isLastPage) {
      context.pushReplacementNamed(Routes.loginScreen);
    } else {
      _goToNextPage();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            OnBoardingTopBar(
              showSkip: !_isLastPage,
              onSkip: () => context.pushReplacementNamed(Routes.loginScreen),
              onChangeLanguage: _onChangeLanguage,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (final BuildContext context, final int index) {
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
