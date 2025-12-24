import 'package:flutter/material.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    final colors = context.customColors;

    return Container(
      height: responsiveHeight(260),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary300, colors.surfaceVariant2],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(24),
            vertical: responsiveHeight(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: responsiveWidth(55),
                backgroundColor: colors.background,
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
                onBackgroundImageError: (_, final _) {},
                child: Icon(
                  Icons.person_rounded,
                  size: responsiveWidth(40),
                  color: colors.accentBlue,
                ),
              ),
              verticalSpacing(8),
              Text(
                'Instructor',
                style: AppTextStyles.font24Bold.copyWith(
                  color: AppColors.grey0,
                  shadows: [
                    const Shadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              verticalSpacing(4),
              Text(
                'Dashboard',
                style: AppTextStyles.font16Bold.copyWith(
                  color: AppColors.grey300,
                ),
              ),
              verticalSpacing(4),
            ],
          ),
        ),
      ),
    );
  }
}
