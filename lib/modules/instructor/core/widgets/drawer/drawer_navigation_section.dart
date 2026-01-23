import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import 'nav_item.dart';
import '../instructor_drawer.dart';

class NavigationSection extends StatelessWidget {
  const NavigationSection({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final List<DrawerDestinationData> destinations;
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(20),
            vertical: responsiveHeight(8),
          ),
          child: Text(
            'instructor_drawer.navigation'.tr(),
            style: AppTextStyles.font14Bold.copyWith(
              color: context.customColors.textSecondary,
            ),
          ),
        ),
        verticalSpacing(4),
        ...destinations.asMap().entries.map((final entry) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(20),
              vertical: responsiveHeight(3),
            ),
            child: NavItem(
              data: entry.value,
              isSelected: selectedIndex == entry.key,
              onTap: () => onItemSelected(entry.key),
            ),
          );
        }),
      ],
    );
  }
}
