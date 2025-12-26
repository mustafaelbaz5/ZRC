import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/instructor/core/widgets/instructor_drawer.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  final DrawerDestinationData data;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Material(
      color: isSelected
          ? colors.accentBlue.withValues(alpha: 0.1)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(responsiveRadius(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(responsiveRadius(12)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(16),
            vertical: responsiveHeight(14),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? colors.accentBlue.withValues(alpha: 0.15)
                      : colors.surfaceVariant.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(responsiveRadius(10)),
                ),
                child: SvgPicture.asset(
                  data.icon,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    isSelected ? colors.accentBlue : colors.textSecondary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              horizontalSpacing(14),
              Expanded(
                child: Text(
                  tr(data.labelKey),
                  style: AppTextStyles.font14Bold.copyWith(
                    color: isSelected ? colors.accentBlue : colors.textPrimary,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
              ),
              if (isSelected)
                Container(
                  width: 4,
                  height: 20,
                  decoration: BoxDecoration(
                    color: colors.accentBlue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
