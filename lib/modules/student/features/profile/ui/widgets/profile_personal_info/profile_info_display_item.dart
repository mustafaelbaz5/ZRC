import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoDisplayItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final IconData? actionIcon; // Optional icon for the button
  final VoidCallback? onActionTap; // Optional callback when tapped

  const ProfileInfoDisplayItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.actionIcon,
    this.onActionTap,
  });

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      child: Row(
        children: <Widget>[
          // Left Icon
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha((0.1 * 255).toInt()),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, size: 20.sp, color: Colors.blue[700]),
          ),

          SizedBox(width: 16.w),

          // Title + Value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
          ),

          // Optional Action Button
          if (actionIcon != null && onActionTap != null)
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.blue.withAlpha((0.15 * 255).toInt()),
                  shape: BoxShape.circle,
                ),
                child: Icon(actionIcon, size: 18.sp, color: Colors.blue[700]),
              ),
            ),
        ],
      ),
    );
  }
}
