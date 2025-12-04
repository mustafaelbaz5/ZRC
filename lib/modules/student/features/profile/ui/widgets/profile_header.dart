import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/core/utils/functions/app_language.dart';
import 'package:zrc/core/utils/functions/names_functions.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  final bool isArabic;
  const ProfileHeader({super.key, required this.user, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    final isArabic = isAppLanguageArabic(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff1E3C72), Color(0xff2A5298)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade900.withAlpha((0.25 * 255).toInt()),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // -------------------- Avatar + Camera Button --------------------
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withAlpha((0.8 * 255).toInt()),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.25 * 255).toInt()),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 48.r,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 45.sp,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),

              Positioned(
                bottom: 4.h,
                right: 4.w,
                child: GestureDetector(
                  onTap: () {
                    /// TODO: Open image picker
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha((0.22 * 255).toInt()),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 18.sp,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // -------------------- User Name --------------------
          Text(
            isArabic
                ? getFirstNWords(user.name)
                : changeNameToEn(context, getFirstNWords(user.name)),
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 8.h),

          // -------------------- Email --------------------
          Text(
            user.email,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white.withAlpha((0.9 * 255).toInt()),
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 16.h),

          // -------------------- ID Badge --------------------
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha((0.18 * 255).toInt()),
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(
                color: Colors.white.withAlpha((0.25 * 255).toInt()),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.badge_rounded, size: 18.sp, color: Colors.white),
                SizedBox(width: 8.w),
                Text(
                  '${'student_profile.header.id_label'.tr()}: ${user.studentCode}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
