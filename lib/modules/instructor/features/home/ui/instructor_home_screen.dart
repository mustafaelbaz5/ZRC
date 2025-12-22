import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/core/storage/secure_storage.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/home_app_bar.dart';
import 'package:zrc/core/widgets/logout_button.dart';
import 'package:zrc/modules/instructor/features/home/ui/widgets/home_head_line_text.dart';
import 'package:zrc/modules/instructor/features/home/ui/widgets/instructor_active_quizzes.dart';
import 'package:zrc/modules/instructor/features/home/ui/widgets/instructor_quick_actions_button.dart';
import 'package:zrc/modules/instructor/features/home/ui/widgets/instructor_statistics_grid.dart';

class InstructorHomeScreen extends StatelessWidget {
  const InstructorHomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return FutureBuilder<String?>(
      future: SecureStorage().getString(key: 'logged_in_user'),
      builder: (final context, final snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final userJson = snapshot.data;
        final user = userJson != null
            ? UserModel.fromJsonString(userJson)
            : null;
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
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(24),

                      // Statistics
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HomeHeadLineText(
                          title: tr('instructor_home.statistics.title'),
                        ),
                      ),
                      verticalSpacing(6),
                      const InstructorStatisticsGrid(),
                      verticalSpacing(32),

                      // Quick Actions
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HomeHeadLineText(
                          title: tr('instructor_home.quick_actions.title'),
                        ),
                      ),
                      verticalSpacing(16),
                      const InstructorQuickActionsButton(),
                      verticalSpacing(32),

                      // Active Quizzes
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HomeHeadLineText(
                          title: tr('instructor_home.statistics.quizzes'),
                        ),
                      ),
                      verticalSpacing(16),
                      const InstructorActiveQuizzes(),
                      verticalSpacing(32),

                      // Logout
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: LogoutButton(),
                      ),
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
