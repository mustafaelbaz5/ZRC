import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';

class ProfileSectionBody extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const ProfileSectionBody({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      decoration: BoxDecoration(
        color: context.customColors.surface,
        borderRadius: BorderRadius.circular(responsiveWidth(16)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha((0.1 * 255).toInt()),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
              responsiveWidth(20),
              responsiveHeight(20),
              responsiveWidth(20),
              responsiveHeight(12),
            ),
            child: Text(
              title,
              style: AppTextStyles.font16Bold.copyWith(
                color: context.customColors.textPrimary,
              ),
            ),
          ),
          ...items,
        ],
      ),
    );
  }
}
