import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/modules/student/features/home/data/model/header_item_model.dart';
import 'package:zrc/modules/student/features/home/ui/widgets/home_header_card.dart';

class HomeHeaderCarousel extends StatefulWidget {
  const HomeHeaderCarousel({super.key});

  @override
  State<HomeHeaderCarousel> createState() => _HomeHeaderCarouselState();
}

class _HomeHeaderCarouselState extends State<HomeHeaderCarousel> {
  late final PageController _pageController;
  late Timer _timer;
  int _currentIndex = 0;
  bool _isForward = true;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: 0.9);

    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_pageController.hasClients) return;

      final lastIndex = headerItems.length - 1;

      if (_isForward) {
        if (_currentIndex < lastIndex) {
          _currentIndex++;
        } else {
          _isForward = false;
          _currentIndex--;
        }
      } else {
        if (_currentIndex > 0) {
          _currentIndex--;
        } else {
          _isForward = true;
          _currentIndex++;
        }
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        onPageChanged: (final index) {
          _currentIndex = index;
        },
        controller: _pageController,
        itemCount: headerItems.length,
        itemBuilder: (final context, final index) {
          final item = headerItems[index];
          return HomeHeaderCard(
            item: item,
            color: index % 2 == 0
                ? context.customColors.blueContainer
                : context.customColors.greenContainer,
          );
        },
      ),
    );
  }
}
