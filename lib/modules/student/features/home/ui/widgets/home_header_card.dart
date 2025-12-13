import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_colors.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/home/data/model/header_item_model.dart';

class HomeHeaderCard extends StatelessWidget {
  const HomeHeaderCard({super.key, required this.item});

  final HeaderItemModel item;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            /// Gradient overlay
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.primary300, AppColors.primary200],
                  ),
                ),
              ),
            ),

            /// Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      tr(item.titleKey),
                      style: AppTextStyles.font20Bold.copyWith(
                        color: AppColors.grey0,
                      ),
                    ),
                  ),
                  horizontalSpacing(12),
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.fill,
                      height: responsiveHeight(120),
                      width: responsiveWidth(120),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
