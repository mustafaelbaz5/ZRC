import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/utils/spacing.dart';

class CategoriesListViewItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String icon;
  final String title;

  const CategoriesListViewItem({
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
            margin: const EdgeInsets.symmetric(horizontal: 14),
            padding: isSelected
                ? const EdgeInsets.all(16)
                : const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.primary300 : Colors.grey.shade300,
                width: 1.5,
              ),
              color: isSelected ? Colors.white : Colors.grey.shade200,
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
            child: SvgPicture.asset(icon, width: 30, height: 30),
          ),

          verticalSpacing(8),

          Text(
            title,
            maxLines: 2, // allow up to 2 lines
            softWrap: true, // wrap text if too long
            textAlign: TextAlign.center, // center below the icon
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? AppColors.primary300 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
