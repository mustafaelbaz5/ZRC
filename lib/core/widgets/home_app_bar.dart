import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';

import '../utils/app_assets.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;

  const HomeAppBar({super.key, required this.userName});

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr('student_home.welcome'),
                style: AppTextStyles.font16Regular.copyWith(
                  color: AppColors.grey300,
                ),
              ),
              Text(
                getFirstNWords(userName, wordCount: 2),
                style: AppTextStyles.font20Bold,
              ),
            ],
          ),
          const Spacer(),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color(0xFFC1C0C0),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2),
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
