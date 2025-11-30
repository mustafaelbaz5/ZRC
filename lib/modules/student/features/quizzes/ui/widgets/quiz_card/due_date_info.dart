import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DueDateInfo extends StatelessWidget {
  const DueDateInfo({super.key, required this.dueDate});
  final DateTime dueDate;

  String _formatDueDate() {
    final now = DateTime.now();
    final difference = dueDate.difference(now).inDays;

    if (difference == 0) return "Due today";
    if (difference == 1) return "Due tomorrow";
    if (difference < 7) return "Due in $difference days";
    return "${dueDate.day}/${dueDate.month}/${dueDate.year}";
  }

  Color _getColor() {
    final difference = dueDate.difference(DateTime.now()).inDays;
    if (difference <= 1) return Colors.red;
    if (difference <= 3) return Colors.orange;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: _getColor().withAlpha(25),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calendar_today_outlined, size: 14.sp, color: _getColor()),
          SizedBox(width: 6.w),
          Text(
            _formatDueDate(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: _getColor(),
            ),
          ),
        ],
      ),
    );
  }
}
