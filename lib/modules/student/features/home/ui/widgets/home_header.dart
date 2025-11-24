import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrc/core/router/app_router.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../../../../../core/widgets/custom_text_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.23,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Stack(
          children: [
            // Background image with fit for better coverage
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
                    colors: [AppColors.lightBlue, AppColors.darkBlue],
                  ),
                ),
              ),
            ),

            // Content: Text + Button + Image
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text + Button
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Watch Latest Videos, \nLearn from Experts',
                            style: AppTextStyles.font16WhiteRegular,
                          ),
                          verticalSpacing(16),
                          // Enhanced button with subtle elevation and ripple
                          SizedBox(
                            height: 48.h,
                            width: double.infinity,
                            child: CustomTextButton(
                              buttonText: 'Start Now',
                              onPressed: () {
                                navigationKey.currentState?.setPage(1);
                              },
                              backgroundColor: Colors.white,
                              textStyle: AppTextStyles.font16BlackBold,
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
