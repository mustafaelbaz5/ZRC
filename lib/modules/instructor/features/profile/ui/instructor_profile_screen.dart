// modules/instructor/features/profile/ui/instructor_profile_screen.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/themes/app_text_styles.dart';
import 'package:zrc/core/widgets/custom_app_bar.dart'; // or your CustomAppBar

class InstructorProfileScreen extends StatelessWidget {
  const InstructorProfileScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Use your shared CustomAppBar (with menu button that opens drawer)
          CustomAppBar(
            title: tr('instructor_drawer.profile'),
            showNotificationIcon: true,
          ),

          // Main content
          const Expanded(
            child: Center(
              child: Text(
                'Instructor Profile Screen',
                style: AppTextStyles.font13Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
