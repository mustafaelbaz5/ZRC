import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.controller, required this.tabs});

  final TabController controller;
  final List<CustomTabItem> tabs;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(16),
      ),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: controller,
        labelColor: colors.textPrimary,
        unselectedLabelColor: colors.textSecondary,
        indicator: BoxDecoration(
          color: colors.successContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
        tabs: tabs.map((final tab) => _TabItem(tab: tab)).toList(),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({required this.tab});

  final CustomTabItem tab;

  @override
  Widget build(final BuildContext context) {
    return Tab(
      height: responsiveHeight(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(tab.icon, size: 20),
          horizontalSpacing(8),
          Text(tab.label, style: AppTextStyles.font14Bold),
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
