import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zrc/core/utils/functions/app_language.dart';

import '../../../../../core/themes/app_text_styles.dart';
import '../../../../../core/utils/spacing.dart';
import 'widgets/course_info.dart';
import 'widgets/course_section_title.dart';
import 'widgets/course_stats_row.dart';
import 'widgets/instructor_card.dart';
import 'widgets/learning_point_list.dart';
import 'widgets/requirements_list.dart';
import 'widgets/youtube_card/youtube_player_card.dart';

class CoursesDetailsScreen extends StatelessWidget {
  const CoursesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: isAppLanguageArabic(context)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                horizontalSpacing(10),
                Text(
                  tr('student_courses.course_details'),
                  style: AppTextStyles.font16BlackBold(),
                ),
                const Spacer(),
              ],
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacing(16),

                    // Video Player
                    const YoutubePlayerCard(
                      videoUrl:
                          'https://youtu.be/r_QH0UD144Y?si=O8LuWXp-VGe1otQm',
                    ),

                    verticalSpacing(20),

                    // Course Title
                    Text(
                      'Flutter Complete Course 2024',
                      style: AppTextStyles.font20BlackBold(),
                    ),

                    verticalSpacing(12),

                    // Course Meta Info
                    const CourseInfo(
                      instructor: 'Dr. Ahmed Mohamed',
                      duration: '12 Hours',
                      lessons: '45 Lessons',
                      level: 'Intermediate',
                      rating: 4.8,
                      students: '2,500',
                    ),

                    verticalSpacing(20),

                    // Course Stats
                    const CourseStatsRow(
                      rating: 4.8,
                      totalRatings: 1250,
                      enrolled: 2500,
                      completionRate: 85,
                    ),

                    verticalSpacing(24),

                    // Course Description
                    CourseSectionTitle(
                      title: tr('student_courses.sections.about'),
                    ),
                    verticalSpacing(12),
                    const Text(
                      'Master Flutter development from scratch with hands-on projects. '
                      'Learn widgets, state management, API integration, and build '
                      'production-ready applications. Perfect for beginners and '
                      'intermediate developers looking to enhance their mobile '
                      'development skills.',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),

                    verticalSpacing(24),

                    // What You'll Learn
                    CourseSectionTitle(
                      title: tr('student_courses.sections.what_you_learn'),
                    ),
                    verticalSpacing(12),
                    const LearningPointsList(
                      points: [
                        'Build beautiful mobile apps with Flutter',
                        'Master Dart programming language',
                        'Implement advanced state management',
                        'Work with APIs and databases',
                        'Deploy apps to App Store and Play Store',
                      ],
                    ),

                    verticalSpacing(24),

                    // Instructor
                    CourseSectionTitle(
                      title: tr('student_courses.sections.instructor'),
                    ),
                    verticalSpacing(12),
                    const InstructorCard(
                      name: 'Dr. Ahmed Mohamed',
                      title: 'Senior Flutter Developer',
                      bio:
                          '10+ years of experience in mobile development. '
                          'Taught over 50,000 students worldwide.',
                      imageUrl:
                          'https://ui-avatars.com/api/?name=Ahmed+Mohamed&size=80',
                      rating: 4.9,
                      courses: 12,
                      students: 25000,
                    ),

                    verticalSpacing(24),

                    // Requirements
                    CourseSectionTitle(
                      title: tr('student_courses.sections.requirements'),
                    ),
                    verticalSpacing(12),
                    const RequirementsList(
                      requirements: [
                        'Basic programming knowledge',
                        'Computer with Windows/Mac/Linux',
                        'Internet connection',
                        'Willingness to learn',
                      ],
                    ),

                    verticalSpacing(100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
