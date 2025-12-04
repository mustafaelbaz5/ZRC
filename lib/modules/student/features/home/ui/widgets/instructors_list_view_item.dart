import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../data/model/instructor_item_model.dart';

class InstructorsListViewItem extends StatelessWidget {
  const InstructorsListViewItem({
    super.key,
    required this.instructor,
    required this.isSelected,
    required this.onTap,
  });

  final InstructorItemModel instructor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            padding: EdgeInsets.all(isSelected ? 16.w : 12.w),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: isSelected ? AppColors.lightBlue : Colors.grey.shade300,
                width: 1.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.lightBlue.withAlpha(20),
                        blurRadius: 8.r,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Image.network(
                instructor.image,
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
          ),

          verticalSpacing(8.h),

          SizedBox(
            width: 60.w,
            child: Text(
              instructor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? AppColors.lightBlue : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
