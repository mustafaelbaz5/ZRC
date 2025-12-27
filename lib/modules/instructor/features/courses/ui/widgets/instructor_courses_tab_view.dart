import 'package:flutter/material.dart';
import '../../../../../../core/utils/functions/string_fun.dart';
import '../../../../../../core/utils/spacing.dart';
import '../../data/models/instructor_course_model.dart';
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

  List<InstructorCourseModel> _getMockCourses() {
    return [
      InstructorCourseModel(
        id: 1,
        title: 'Flutter Basics - Building Your First App',
        description: 'Learn Flutter from scratch with hands-on projects',
        status: CourseStatus.draft,
        instructorId: 'inst_01',
        category: 'Mobile Development',
        youtubeUrl: 'https://youtu.be/aGvnjGd7tWk?si=VPaaMUnrVeZkCIub',
        thumbnailUrl: getYoutubeThumbnail(
          'https://youtu.be/aGvnjGd7tWk?si=VPaaMUnrVeZkCIub',
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
        rejectionReason: null,
        studentsEnrolled: 0,
        totalViews: 0,
        averageRating: null,
        learningPoints: ['Widgets', 'Layouts', 'State management'],
        instructorNotes: 'Still working on content',
      ),
      InstructorCourseModel(
        id: 2,
        title: 'Advanced Dart Programming',
        description: 'Deep dive into Dart language features and best practices',
        status: CourseStatus.pending,
        instructorId: 'inst_01',
        category: 'Programming',
        youtubeUrl: 'https://youtu.be/dQw4w9WgXcQ',
        thumbnailUrl: getYoutubeThumbnail('https://youtu.be/dQw4w9WgXcQ'),
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 12)),
        rejectionReason: null,
        studentsEnrolled: 0,
        totalViews: 120,
        averageRating: 4.5,
        learningPoints: ['Streams', 'Isolates', 'Asynchronous programming'],
        instructorNotes: 'Waiting for admin approval',
      ),
      InstructorCourseModel(
        id: 3,
        title: 'Aviation Navigation Systems',
        description: 'Understand modern air navigation and flight systems',
        status: CourseStatus.published,
        instructorId: 'inst_01',
        category: 'Aviation',
        youtubeUrl: 'https://youtube.com/watch?v=example123',
        thumbnailUrl: getYoutubeThumbnail(
          'https://youtube.com/watch?v=example123',
        ),
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
        rejectionReason: null,
        studentsEnrolled: 320,
        totalViews: 2450,
        averageRating: 4.8,
        learningPoints: ['GPS', 'INS', 'VOR & DME'],
        instructorNotes: null,
      ),
      InstructorCourseModel(
        id: 4,
        title: 'UI/UX Design Principles',
        description: 'Master modern design principles for mobile apps',
        status: CourseStatus.published,
        instructorId: 'inst_01',
        category: 'Design',
        youtubeUrl: 'https://youtu.be/ScMzIvxBSi4',
        thumbnailUrl: getYoutubeThumbnail('https://youtu.be/ScMzIvxBSi4'),
        createdAt: DateTime.now().subtract(const Duration(days: 45)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
        rejectionReason: null,
        studentsEnrolled: 567,
        totalViews: 4320,
        averageRating: 4.9,
        learningPoints: ['Color Theory', 'Typography', 'User Research'],
        instructorNotes: null,
      ),
      InstructorCourseModel(
        id: 5,
        title: 'Firebase Integration Guide',
        description: 'Complete guide to integrating Firebase in your apps',
        status: CourseStatus.rejected,
        instructorId: 'inst_01',
        category: 'Backend',
        youtubeUrl: 'https://youtu.be/example456',
        thumbnailUrl: getYoutubeThumbnail('https://youtu.be/example456'),
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 6)),
        rejectionReason: 'Content quality needs improvement',
        studentsEnrolled: 0,
        totalViews: 45,
        averageRating: null,
        learningPoints: ['Authentication', 'Firestore', 'Cloud Functions'],
        instructorNotes: 'Need to revise authentication section',
      ),
      InstructorCourseModel(
        id: 6,
        title: 'State Management with Bloc',
        description: 'Learn professional state management patterns',
        status: CourseStatus.draft,
        instructorId: 'inst_01',
        category: 'Mobile Development',
        youtubeUrl: '',
        thumbnailUrl: null,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(minutes: 30)),
        rejectionReason: null,
        studentsEnrolled: 0,
        totalViews: 0,
        averageRating: null,
        learningPoints: ['Bloc Pattern', 'Cubit', 'Event Handling'],
        instructorNotes: 'Just started working on this',
      ),
    ];
  }
}
