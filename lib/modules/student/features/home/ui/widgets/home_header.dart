import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/router/routes.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/custom_text_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.23,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: SvgPicture.asset(
                AppAssets.onBoardingBackground,
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[AppColors.primary300, AppColors.primary200],
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            tr('student_home.header_title'),
                            style: AppTextStyles.font16Regular.copyWith(
                              color: AppColors.grey0,
                            ),
                          ),
                          verticalSpacing(16),
                          SizedBox(
                            height: 48.h,
                            width: double.infinity,
                            child: CustomTextButton(
                              buttonText: tr('student_home.header_button'),
                              onPressed: () {
                                context.pushNamed(Routes.studentCoursesScreen);
                              },
                              backgroundColor: AppColors.grey0,
                              textStyle: AppTextStyles.font16Bold,
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    horizontalSpacing(16),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          AppAssets.onBoardingBanner1,
                          height: 200,
                          width: 200,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
