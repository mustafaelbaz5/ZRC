import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_text_styles.dart';
import '../utils/spacing.dart';

/// Show error dialog
void showErrorDialog({
  required final BuildContext context,
  required final String title,
  required final String message,
  final String buttonText = 'OK',
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (final BuildContext ctx) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 8,
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Error icon
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withAlpha(20),
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                  size: 48.sp,
                ),
              ),
              SizedBox(height: 16.h),

              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.font20BlackBold(),
              ),
              SizedBox(height: 12.h),

              // Message
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.font16GreyRegular(),
              ),
              verticalSpacing(16),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(
                    buttonText,
                    style: AppTextStyles.font16BlackRegular(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
