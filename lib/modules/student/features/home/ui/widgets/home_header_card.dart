import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/themes/app_text_styles.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../data/model/header_item_model.dart';

class HomeHeaderCard extends StatelessWidget {
  const HomeHeaderCard({super.key, required this.item, required this.color});

  final HeaderItemModel item;
  final Color color;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(6)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [context.theme.cardColor, color],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      tr(item.titleKey),
                      style: AppTextStyles.font20Bold,
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
