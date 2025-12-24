import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/auth/data/model/user_model.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/functions/string_fun.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/home_app_bar.dart';
import 'widgets/home_categories_list_view.dart';
import 'widgets/home_course/home_courses_section.dart';
import 'widgets/home_header_carousel.dart';
import 'widgets/instructors_list_view.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  Future<UserModel?> _getLoggedInUser() async {
    final String? userDataString = await SecureStorage().getString(
      key: 'logged_in_user',
    );

    if (userDataString == null || userDataString.isEmpty) {
      return null;
    }

    return UserModel.fromJsonString(userDataString);
  }

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: _getLoggedInUser(),
      builder: (final context, final snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.pushNamedAndRemoveAll(Routes.onBoardingScreen);
          });

          return const SizedBox.shrink();
        }

        final user = snapshot.data!;
        final userName = convertNamesToEn(context, user.name);

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                HomeAppBar(userName: userName),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacing(20),
                        const HomeHeaderCarousel(),

                        verticalSpacing(24),
                        Text(
                          tr('student_home.categories_title'),
                          style: AppTextStyles.font18Bold,
                        ),
                        verticalSpacing(16),
                        const HomeCategoriesListView(),

                        verticalSpacing(16),
                        const HomeCoursesSection(),

                        verticalSpacing(16),
                        Text(
                          tr('student_home.instructors_title'),
                          style: AppTextStyles.font18Bold,
                        ),
                        verticalSpacing(12),
                        const InstructorsListView(),

                        verticalSpacing(30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
