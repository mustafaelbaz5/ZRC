import 'package:flutter/material.dart';
import 'package:zrc/core/models/course_model.dart';

import '../../../../../../core/utils/spacing.dart';
import 'courses_tab_view/courses_empty_state.dart';
import 'instructor_course_card.dart';

class InstructorCoursesTabView extends StatelessWidget {
  const InstructorCoursesTabView({super.key, required this.statuses});

  final List<CourseStatus> statuses;

  @override
  Widget build(final BuildContext context) {
    final allCourses = _getMockCourses();

    final filteredCourses = allCourses
        .where((final course) => statuses.contains(course.status))
        .toList();

    if (filteredCourses.isEmpty) {
      return CoursesEmptyState(status: statuses.first);
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(20),
        vertical: responsiveHeight(16),
      ),
      itemCount: filteredCourses.length,
      separatorBuilder: (_, final _) => verticalSpacing(16),
      itemBuilder: (final context, final index) {
        return InstructorCourseCard(course: filteredCourses[index]);
      },
    );
  }

  List<CourseModel> _getMockCourses() {
    return [
      CourseModel(
        id: '1',
        instructorId: '101',
        instructorName: 'Ahmed Ali',
        instructorBio: 'Flutter & Dart enthusiast',
        instructorAvatar: 'https://i.pravatar.cc/150?img=1',
        title: 'Flutter for Beginners',
        description: 'Learn the basics of Flutter and build your first app.',
        category: 'Mobile Development',
        youtubeUrl: 'https://www.youtube.com/watch?v=fq4N0hgOWzU',
        thumbnailUrl: 'https://img.youtube.com/vi/fq4N0hgOWzU/0.jpg',
        status: CourseStatus.approved,
        learningPoints: ['Flutter Widgets', 'State Management', 'Layouts'],
        requirements: ['Basic programming knowledge'],
        totalViews: 1250,
        averageRating: 4.5,
        totalRatings: 45,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
        hasViewed: true,
        isCompleted: false,
        userRating: 5,
        userReview: 'Great course!',
      ),
      CourseModel(
        id: '2',
        instructorId: '102',
        instructorName: 'Sara Mohamed',
        instructorBio: 'UI/UX Designer & Mobile Developer',
        instructorAvatar: 'https://i.pravatar.cc/150?img=2',
        title: 'Advanced Flutter Animations',
        description:
            'Master animations in Flutter and create stunning UI effects.',
        category: 'Mobile Development',
        youtubeUrl: 'https://www.youtube.com/watch?v=3BfYTXlNwJ4',
        thumbnailUrl: 'https://img.youtube.com/vi/3BfYTXlNwJ4/0.jpg',
        status: CourseStatus.pending,
        learningPoints: [
          'Implicit Animations',
          'Explicit Animations',
          'Lottie',
        ],
        requirements: ['Flutter basics'],
        totalViews: 780,
        averageRating: 4.8,
        totalRatings: 20,
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
        hasViewed: false,
        isCompleted: false,
        userRating: null,
        userReview: null,
      ),
      CourseModel(
        id: '3',
        instructorId: '103',
        instructorName: 'Mohamed Hossam',
        instructorBio: 'Backend & Mobile Developer',
        instructorAvatar: 'https://i.pravatar.cc/150?img=3',
        title: 'Fullstack Flutter with Supabase',
        description:
            'Learn to build fullstack apps using Flutter and Supabase.',
        category: 'Fullstack Development',
        youtubeUrl: 'https://www.youtube.com/watch?v=R3jc8dJtOQ4',
        thumbnailUrl: 'https://img.youtube.com/vi/R3jc8dJtOQ4/0.jpg',
        status: CourseStatus.draft,
        learningPoints: ['Supabase Auth', 'Database', 'Realtime Updates'],
        requirements: ['Flutter intermediate knowledge'],
        totalViews: 300,
        averageRating: 4.2,
        totalRatings: 10,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now(),
        hasViewed: false,
        isCompleted: false,
        userRating: null,
        userReview: null,
      ),
    ];
  }
}
