import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/widgets/custom_app_bar.dart';

class InstructorQuizzesScreen extends StatelessWidget {
  const InstructorQuizzesScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: tr('instructor_drawer.quizzes'),
            showNotificationIcon: true,
          ),

          // Main content
          const Expanded(
            child: Center(
              child: Text(
                'Quizzes Management Screen',
                style: AppTextStyles.font13Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
