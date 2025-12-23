import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/widgets/custom_app_bar.dart';

class AddEditCourseScreen extends StatelessWidget {
  const AddEditCourseScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: tr('instructor_drawer.courses'),
              showNotificationIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}
