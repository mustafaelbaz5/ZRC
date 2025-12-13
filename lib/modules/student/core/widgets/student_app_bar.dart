import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/notification_button.dart';

class StudentAppBar extends StatelessWidget {
  const StudentAppBar({
    super.key,
    required this.title,
    this.showNotificationIcon = false,
    this.showBackButton = false,
    this.onNotificationTap,
  });

  final String title;
  final bool showNotificationIcon;
  final bool showBackButton;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(14),
      ),
      decoration: BoxDecoration(
        color: context.customColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
        boxShadow: [
          BoxShadow(
            color: context.customColors.borderColor,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showBackButton)
            _AppBarIconButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          else
            const SizedBox.shrink(),

          horizontalSpacing(12),

          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.font18Bold.copyWith(
                color: context.customColors.onContainerPrimary,
              ),
            ),
          ),

          horizontalSpacing(12),

          if (showNotificationIcon)
            const NotificationButton()
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _AppBarIconButton extends StatelessWidget {
  const _AppBarIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: responsiveWidth(44),
          height: responsiveHeight(44),
          decoration: BoxDecoration(
            color: context.customColors.borderColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, size: 20, color: context.customColors.borderColor),
        ),
      ),
    );
  }
}
