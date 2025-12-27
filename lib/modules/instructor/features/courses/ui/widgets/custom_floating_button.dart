import 'package:flutter/material.dart';
import '../../../../../../core/themes/app_colors.dart';

import '../../../../../../core/themes/app_text_styles.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key, required this.label, this.onTap});
  final String label;
  final void Function()? onTap;

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onTap,
      backgroundColor: AppColors.success300,
      icon: const Icon(Icons.add_rounded, color: AppColors.grey0),
      label: Text(
        label,
        style: AppTextStyles.font14Bold.copyWith(color: AppColors.grey0),
      ),
    );
  }
}
