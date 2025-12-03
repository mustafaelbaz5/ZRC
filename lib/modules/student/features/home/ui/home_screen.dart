import 'package:flutter/material.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/core/storage/secure_storage.dart';
import 'package:zrc/core/utils/functions/change_language.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/core/storage/secure_storage.dart';
import 'package:zrc/core/utils/functions/change_language.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import 'widgets/categories_list_view.dart';
import 'widgets/courses_list_view.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_header.dart';
import 'widgets/instructors_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: SecureStorage().getString(key: 'logged_in_user'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final userDataString = snapshot.data;
        final UserModel? userData = userDataString != null
            ? UserModel.fromJsonString(userDataString)
            : null;

        final String userName = userData != null
            ? changeNameToEn(context, userData.name)
            : "Guest";
        final String userId = userData?.studentCode.toString() ?? "-";

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(20),
                  HomeAppBar(userName: userName, userId: userId),
                  verticalSpacing(20),
                  const HomeHeader(),
                  verticalSpacing(24),
                  Text("Categories", style: AppTextStyles.font16BlackBold()),
                  verticalSpacing(12),
                  const CategoriesListView(),
                  verticalSpacing(24),
                  Row(
                    children: [
                      Text("Courses", style: AppTextStyles.font16BlackBold()),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              "See all",
                              style: AppTextStyles.font13BlueBold(),
                            ),
                            horizontalSpacing(4),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.lightBlue,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(12),
                  const CoursesListView(),
                  verticalSpacing(24),
                  Text(
                    "Top Instructors",
                    style: AppTextStyles.font16BlackBold(),
                  ),
                  verticalSpacing(12),
                  const InstructorsListView(),
                  verticalSpacing(30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
