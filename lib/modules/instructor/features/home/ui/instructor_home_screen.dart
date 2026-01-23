import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/auth/data/model/user_model.dart';
import '../../../../../core/auth/data/repo/auth_repo.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/utils/functions/string_fun.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../../core/widgets/home_app_bar.dart';
import 'widgets/home_head_line_text.dart';
import 'widgets/instructor_active_quizzes.dart';
import 'widgets/instructor_quick_actions_button.dart';
import 'widgets/instructor_statistics_grid.dart';

class InstructorHomeScreen extends StatelessWidget {
  const InstructorHomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: getIt<AuthRepo>().getCurrentUser(),
      builder: (final context, final snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = snapshot.data;
        final userName = user != null
            ? convertNamesToEn(context, user.name)
            : tr('student_home.guest');

        return SafeArea(
          child: Column(
            children: [
              HomeAppBar(userName: getFirstNWords(userName, wordCount: 2)),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: responsiveHeight(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(24),

                      // Statistics
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(20),
                        ),
                        child: HomeHeadLineText(
                          title: tr('instructor_home.statistics.title'),
                        ),
                      ),
                      verticalSpacing(6),
                      const InstructorStatisticsGrid(),
                      verticalSpacing(32),

                      // Quick Actions
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(20),
                        ),
                        child: HomeHeadLineText(
                          title: tr('instructor_home.quick_actions.title'),
                        ),
                      ),
                      verticalSpacing(16),
                      const InstructorQuickActionsButton(),
                      verticalSpacing(32),

                      // Active Quizzes
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(20),
                        ),
                        child: HomeHeadLineText(
                          title: tr('instructor_home.statistics.quizzes'),
                        ),
                      ),
                      verticalSpacing(16),
                      const InstructorActiveQuizzes(),
                      verticalSpacing(32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
