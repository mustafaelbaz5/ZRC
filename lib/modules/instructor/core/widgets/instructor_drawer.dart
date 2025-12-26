import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/app_assets.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/instructor/core/widgets/drawer/custom_drawer_header.dart';
import 'package:zrc/modules/instructor/core/widgets/drawer/drawer_logout_section.dart';
import 'package:zrc/modules/instructor/core/widgets/drawer/drawer_navigation_section.dart';
import 'package:zrc/modules/instructor/core/widgets/drawer/drawer_settings_section.dart';

class InstructorDrawer extends StatelessWidget {
  const InstructorDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  static const _destinations = [
    DrawerDestinationData(
      icon: AppAssets.homeIcon,
      labelKey: 'instructor_drawer.home',
    ),
    DrawerDestinationData(
      icon: AppAssets.computerIcon,
      labelKey: 'instructor_drawer.courses',
    ),
    DrawerDestinationData(
      icon: AppAssets.bookIcon,
      labelKey: 'instructor_drawer.quizzes',
    ),
    DrawerDestinationData(
      icon: AppAssets.profileIcon,
      labelKey: 'instructor_drawer.profile',
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    return Drawer(
      backgroundColor: context.customColors.background,
      child: SafeArea(
        child: Column(
          children: [
            const CustomDrawerHeader(),
            verticalSpacing(8),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  NavigationSection(
                    destinations: _destinations,
                    selectedIndex: selectedIndex,
                    onItemSelected: onItemSelected,
                  ),
                  verticalSpacing(16),
                  const DrawerSettingsSection(),
                  verticalSpacing(72),
                  const DrawerLogoutSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerDestinationData {
  const DrawerDestinationData({required this.icon, required this.labelKey});

  final String icon;
  final String labelKey;
}
