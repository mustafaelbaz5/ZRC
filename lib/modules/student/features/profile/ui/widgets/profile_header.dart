import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';

import '../../../../../../core/auth/data/model/user_model.dart';
import '../../../../../../core/utils/functions/string_fun.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(final BuildContext context) {
    final bool isArabic = context.isArabic;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: <Color>[Color(0xff1E3C72), Color(0xff2A5298)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue.shade900.withAlpha((0.25 * 255).toInt()),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          // -------------------- Avatar + Camera Button --------------------
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withAlpha((0.8 * 255).toInt()),
                    width: 3,
                  ),
                  boxShadow: <BoxShadow>[
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
                      boxShadow: <BoxShadow>[
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
                : convertNamesToEn(context, getFirstNWords(user.name)),
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
              children: <Widget>[
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
