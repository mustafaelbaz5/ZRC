import 'package:flutter/material.dart';
import 'package:zrc/core/extensions/context_extensions.dart';
import 'package:zrc/core/utils/spacing.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/detailed_screen_widgets/course_description.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/detailed_screen_widgets/course_stats.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/detailed_screen_widgets/course_title_section.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/detailed_screen_widgets/hero_video_section.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/detailed_screen_widgets/learning_points.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/detailed_screen_widgets/start_course_button.dart';
import 'package:zrc/modules/student/features/courses/ui/widgets/detailed_screen_widgets/video_player_screen.dart';

class StudentCoursesDetailsScreen extends StatelessWidget {
  const StudentCoursesDetailsScreen({super.key});

  void _openVideoPlayer(final BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const VideoPlayerScreen(
          videoUrl: 'https://youtu.be/r_QH0UD144Y?si=O8LuWXp-VGe1otQm',
          courseTitle: 'Flutter Complete Course 2024',
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: context.customColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                _buildSliverAppBar(context),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeroVideoSection(
                          onTap: () => _openVideoPlayer(context),
                        ),
                        verticalSpacing(24),
                        const CourseTitleSection(),
                        verticalSpacing(20),
                        CourseStats(customColors: context.customColors),
                        verticalSpacing(28),
                        CourseDescription(customColors: context.customColors),
                        verticalSpacing(28),
                        LearningPoints(customColors: context.customColors),
                        verticalSpacing(100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: StartCourseButton(onTap: () => _openVideoPlayer(context)),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(final BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: context.customColors.background,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: context.customColors.textPrimary,
        ),
      ),
    );
  }
}
