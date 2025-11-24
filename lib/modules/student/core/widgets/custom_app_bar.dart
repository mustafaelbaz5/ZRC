import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zrc/core/router/app_router.dart';

import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/app_assets.dart';
import 'package:zrc/core/utils/spacing.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.routes});
  final String title;
  final int routes;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          horizontalSpacing(8),
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              navigationKey.currentState?.setPage(routes);
            },
          ),
          horizontalSpacing(8),
          Text(title, style: AppTextStyles.font20BlackBold),
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
          horizontalSpacing(16),
        ],
      ),
    );
  }
}
