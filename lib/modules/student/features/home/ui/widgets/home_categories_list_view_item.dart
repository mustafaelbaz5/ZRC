import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class HomeCategoriesListViewItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String icon;
  final String title;

  const HomeCategoriesListViewItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Icon Container
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            margin: EdgeInsets.symmetric(horizontal: responsiveWidth(14)),
            padding: isSelected
                ? EdgeInsets.all(responsiveWidth(18))
                : EdgeInsets.all(responsiveWidth(14)),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected
                    ? context.customColors.onContainerPrimary
                    : context.customColors.secondaryColor,
                width: 1.5,
              ),
              color: isSelected
                  ? context.customColors.containerColor
                  : context.customColors.secondaryColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: isSelected
                  ? <BoxShadow>[
                      BoxShadow(
                        color: AppColors.primary300.withAlpha(20),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : <BoxShadow>[],
            ),
            child: SvgPicture.asset(
              icon,
              width: responsiveWidth(24),
              height: responsiveHeight(24),
            ),
          ),

          verticalSpacing(8),

          SizedBox(
            width: responsiveWidth(100),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: isSelected
                  ? AppTextStyles.font14Bold.copyWith(
                      color: context.customColors.onContainerPrimary,
                    )
                  : AppTextStyles.font13Bold.copyWith(
                      fontSize: 12,
                      color: context.customColors.onContainerSecondary,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
