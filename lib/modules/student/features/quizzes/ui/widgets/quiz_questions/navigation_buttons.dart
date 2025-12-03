import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../../core/utils/spacing.dart';

class NavigationButtons extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSubmit;
  final bool hasAnswer;

  const NavigationButtons({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.onPrevious,
    required this.onNext,
    required this.onSubmit,
    required this.hasAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final isLastQuestion = currentIndex == totalQuestions - 1;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.04 * 255).toInt()),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (currentIndex > 0)
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onPrevious,
                icon: Icon(Icons.arrow_back, size: 18.sp, color: Colors.grey),
                label: Text(
                  'Previous',
                  style: AppTextStyles.font14BlackRegular(),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey[80],
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  side: BorderSide(color: Colors.grey[300]!),
                ),
              ),
            ),
          if (currentIndex > 0) horizontalSpacing(12),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: hasAnswer
                  ? (isLastQuestion ? onSubmit : onNext)
                  : null,
              icon: Icon(
                isLastQuestion ? Icons.check_circle : Icons.arrow_forward,
                size: 18.sp,
              ),
              label: Text(
                isLastQuestion ? 'Submit Quiz' : 'Next',
                style: AppTextStyles.font18WhiteRegular(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isLastQuestion
                    ? Colors.green[600]
                    : Colors.blue[700],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: hasAnswer ? 4 : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
