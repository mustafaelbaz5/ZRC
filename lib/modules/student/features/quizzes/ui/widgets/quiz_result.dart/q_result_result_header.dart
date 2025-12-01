import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QResultResultHeader extends StatelessWidget {
  final bool isPassed;
  final int percentage;

  const QResultResultHeader({
    super.key,
    required this.isPassed,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isPassed
              ? [Colors.green[600]!, Colors.green[400]!]
              : [Colors.orange[600]!, Colors.orange[400]!],
        ),
      ),
      child: Column(
        children: [
          // Icon with animation effect
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((0.2 * 255).toInt()),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                isPassed ? Icons.emoji_events : Icons.pending_actions,
                size: 60.sp,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            isPassed ? 'Congratulations!' : 'Keep Trying!',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            isPassed
                ? 'You passed the quiz successfully'
                : 'You can improve with practice',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white.withAlpha((0.9 * 255).toInt()),
            ),
          ),
        ],
      ),
    );
  }
}
