import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/spacing.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;
  final String userId;

  const HomeAppBar({super.key, required this.userName, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white, // No shadow here
      child: Row(
        children: [
          // Welcome + ID
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome,  ',
                      style: AppTextStyles.font16GreyRegular,
                    ),
                    TextSpan(
                      text: userName,
                      style: AppTextStyles.font20BlackBold,
                    ),
                  ],
                ),
              ),
              verticalSpacing(4),
              Text("  ID: $userId", style: AppTextStyles.font13greyRegular),
            ],
          ),
          const Spacer(),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SvgPicture.asset(
              AppAssets.notificationIcon,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
