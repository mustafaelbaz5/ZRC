import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

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
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(24),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            context.customColors.background,
            AppColors.primary200,
            AppColors.primary400,
            context.customColors.background,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26.r),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.primary400.withAlpha((0.25 * 255).toInt()),
            blurRadius: 4,
            offset: const Offset(0, 2),
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
                padding: EdgeInsets.all(responsiveWidth(6)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.grey0.withAlpha((0.8 * 255).toInt()),
                    width: 3,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.grey900.withAlpha((0.25 * 255).toInt()),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 48.r,
                  backgroundColor: AppColors.grey0,
                  child: Icon(
                    Icons.person,
                    size: 45.sp,
                    color: AppColors.primary200,
                  ),
                ),
              ),

              Positioned(
                bottom: responsiveHeight(4),
                right: responsiveWidth(4),
                child: GestureDetector(
                  onTap: () {
                    /// TODO: Open image picker
                  },
                  child: Container(
                    padding: EdgeInsets.all(responsiveWidth(8)),
                    decoration: BoxDecoration(
                      color: AppColors.grey0,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppColors.grey900.withAlpha(
                            (0.22 * 255).toInt(),
                          ),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 18.sp,
                      color: AppColors.primary300,
                    ),
                  ),
                ),
              ),
            ],
          ),

          verticalSpacing(20),

          // -------------------- User Name --------------------
          Text(
            isArabic
                ? getFirstNWords(user.name)
                : convertNamesToEn(context, getFirstNWords(user.name)),
            style: AppTextStyles.font24Bold.copyWith(
              color: AppColors.grey0,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 8.h),

          // -------------------- Email --------------------
          Text(
            user.email,
            style: AppTextStyles.font14Regular.copyWith(
              color: AppColors.grey0.withAlpha((0.9 * 255).toInt()),
              fontWeight: FontWeight.w500,
            ),
          ),

          verticalSpacing(16),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(18),
              vertical: responsiveHeight(8),
            ),
            decoration: BoxDecoration(
              color: AppColors.grey0.withAlpha((0.18 * 255).toInt()),
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(
                color: AppColors.grey0.withAlpha((0.25 * 255).toInt()),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.badge_rounded, size: 18.sp, color: AppColors.grey0),
                horizontalSpacing(8),
                Text(
                  '${'student_profile.header.id_label'.tr()}: ${user.studentCode}',
                  style: AppTextStyles.font14Bold.copyWith(
                    color: AppColors.grey0,
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
