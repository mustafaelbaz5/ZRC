import 'package:flutter/material.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/router/routes.dart';
import '../../../../../../core/themes/app_text_styles.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key, required this.label});
  final String label;

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 0,
      onPressed: () => context.pushNamed(Routes.addEditCourseScreen),
      backgroundColor: context.customColors.surfaceVariant2,
      icon: const Icon(Icons.add_rounded),
      label: Text(label, style: AppTextStyles.font14Bold),
    );
  }
}
