import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/core/storage/secure_storage.dart';
import 'package:zrc/core/utils/functions/string_fun.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/core/widgets/home_app_bar.dart';
import 'package:zrc/modules/instructor/features/home/ui/widgets/active_quiz_card.dart';
import 'package:zrc/modules/instructor/features/home/ui/widgets/home_head_line_text.dart';
import 'package:zrc/modules/student/features/profile/ui/widgets/logout_button.dart';

import 'widgets/quick_action_button.dart';
import 'widgets/statistics_card.dart';

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

        final userDataString = snapshot.data;
        final userData = userDataString != null
            ? UserModel.fromJsonString(userDataString)
            : null;

        final userName = userData != null
            ? convertNamesToEn(context, userData.name)
            : tr('student_home.guest');

        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // App Bar
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  sliver: SliverToBoxAdapter(
                    child: HomeAppBar(userName: userName),
                  ),
                ),

                SliverToBoxAdapter(child: verticalSpacing(32)),

                // Statistics Section
                HomeHeadLineText(title: tr('instructor_home.statistics.title')),
                SliverToBoxAdapter(child: verticalSpacing(16)),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    delegate: SliverChildListDelegate([
                      StatisticsCard(
                        icon: Icons.book_rounded,
                        title: tr('instructor_home.statistics.courses'),
                        value: '12',
                        color: const Color(0xFF2196F3),
                      ),
                      StatisticsCard(
                        icon: Icons.edit_note_rounded,
                        title: tr('instructor_home.statistics.quizzes'),
                        value: '3',
                        color: const Color(0xFFFF9800),
                      ),
                      StatisticsCard(
                        icon: Icons.people_rounded,
                        title: tr('instructor_home.statistics.avg_score'),
                        value: '860',
                        color: const Color(0xFF4CAF50),
                      ),
                      const StatisticsCard(
                        icon: Icons.visibility_rounded,
                        title: 'Total Views',
                        value: '34.2K',
                        color: Color(0xFF9C27B0),
                      ),
                    ]),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.55,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                  ),
                ),

                SliverToBoxAdapter(child: verticalSpacing(40)),

                // Quick Actions Section
                HomeHeadLineText(
                  title: tr('instructor_home.quick_actions.title'),
                ),
                SliverToBoxAdapter(child: verticalSpacing(16)),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: QuickActionButton(
                            title: tr(
                              'instructor_home.quick_actions.create_course',
                            ),
                            icon: Icons.add_box_rounded,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: QuickActionButton(
                            title: tr(
                              'instructor_home.quick_actions.create_video',
                            ),
                            icon: Icons.video_library_rounded,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: verticalSpacing(12)),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: QuickActionButton(
                            title: tr(
                              'instructor_home.quick_actions.create_quiz',
                            ),
                            icon: Icons.quiz_rounded,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: QuickActionButton(
                            title: tr(
                              'instructor_home.quick_actions.create_assignment',
                            ),
                            icon: Icons.pending_actions_rounded,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: verticalSpacing(40)),

                // Active Quizzes Section
                HomeHeadLineText(
                  title: tr('instructor_home.statistics.quizzes'),
                ),
                SliverToBoxAdapter(child: verticalSpacing(16)),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 170,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        ActiveQuizCard(
                          title: 'Aviation Safety Basics',
                          questionsCount: 20,
                          deadline: 'Dec 28, 2025',
                          onTap: () {},
                        ),
                        ActiveQuizCard(
                          title: 'Navigation Quiz',
                          questionsCount: 15,
                          deadline: 'Dec 30, 2025',
                          onTap: () {},
                        ),
                        ActiveQuizCard(
                          title: 'Meteorology Quiz',
                          questionsCount: 25,
                          deadline: 'Jan 2, 2026',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: verticalSpacing(32)),
                const SliverToBoxAdapter(child: LogoutButton()),
              ],
            ),
          ),
        );
      },
    );
  }
}
