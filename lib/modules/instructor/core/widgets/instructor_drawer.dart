import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/app_assets.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/instructor/core/widgets/drawer/custom_drawer_header.dart';
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
    _DrawerDestinationData(
      icon: AppAssets.homeIcon,
      labelKey: 'instructor_drawer.home',
    ),
    _DrawerDestinationData(
      icon: AppAssets.computerIcon,
      labelKey: 'instructor_drawer.courses',
    ),
    _DrawerDestinationData(
      icon: AppAssets.bookIcon,
      labelKey: 'instructor_drawer.quizzes',
    ),
    _DrawerDestinationData(
      icon: AppAssets.profileIcon,
      labelKey: 'instructor_drawer.profile',
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Drawer(
      backgroundColor: colors.background,
      child: Column(
        children: [
          const CustomDrawerHeader(),
          verticalSpacing(16),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ..._destinations.asMap().entries.map((final entry) {
                  final index = entry.key;
                  final dest = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: _buildDestination(context, dest, index),
                  );
                }),
                verticalSpacing(16),
                const Divider(
                  height: 32,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                const DrawerSettingsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestination(
    final BuildContext context,
    final _DrawerDestinationData data,
    final int index,
  ) {
    final colors = context.customColors;
    final isSelected = selectedIndex == index;

    return Material(
      color: isSelected ? colors.surfaceVariant2 : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => onItemSelected(index),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              SvgPicture.asset(
                data.icon,
                width: responsiveWidth(24),
                height: responsiveHeight(24),
                colorFilter: ColorFilter.mode(
                  isSelected ? colors.accentBlue : colors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              horizontalSpacing(16),
              Expanded(
                child: Text(
                  tr(data.labelKey),
                  style: AppTextStyles.font16Bold.copyWith(
                    color: isSelected
                        ? colors.textPrimary
                        : colors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerDestinationData {
  const _DrawerDestinationData({required this.icon, required this.labelKey});

  final String icon;
  final String labelKey;
}
