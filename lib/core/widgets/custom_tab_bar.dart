import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';
import '../utils/spacing.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.controller, required this.tabs});

  final TabController controller;
  final List<CustomTabItem> tabs;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: responsiveHeight(48),
      child: TabBar(
        controller: controller,
        isScrollable: true,
        labelColor: AppColors.grey0,
        unselectedLabelColor: context.customColors.textSecondary,
        indicator: BoxDecoration(
          color: AppColors.primary400,
          borderRadius: BorderRadius.circular(12),
        ),
        indicatorSize: TabBarIndicatorSize.tab,

        indicatorPadding: const EdgeInsets.symmetric(horizontal: 6),
        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
        tabs: tabs
            .asMap()
            .entries
            .map(
              (final entry) => _TabItem(
                tab: entry.value,
                isSelected: controller.index == entry.key,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({required this.tab, required this.isSelected});

  final CustomTabItem tab;
  final bool isSelected;

  @override
  Widget build(final BuildContext context) {
    return Tab(
      height: responsiveHeight(40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(tab.icon, size: 16),
          horizontalSpacing(4),
          Flexible(child: Text(tab.label, style: AppTextStyles.font14Bold)),
        ],
      ),
    );
  }
}

class CustomTabItem {
  final String label;
  final IconData icon;

  const CustomTabItem({required this.label, required this.icon});
}
