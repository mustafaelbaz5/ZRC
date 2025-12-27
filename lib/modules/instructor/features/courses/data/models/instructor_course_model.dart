class InstructorCourseModel {
  final int id;
  final String instructorId;

  final String title;
  final String description;
  final String category;

  final String youtubeUrl;
  final String? thumbnailUrl;

  final CourseStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? rejectionReason;

  final int studentsEnrolled;
  final int totalViews;
  final double? averageRating;
  final List<String>? learningPoints;
  final String? instructorNotes;

  const InstructorCourseModel({
    required this.id,
    required this.instructorId,
    required this.title,
    required this.description,
    required this.category,
    required this.youtubeUrl,
    required this.thumbnailUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.rejectionReason,
    required this.studentsEnrolled,
    required this.totalViews,
    required this.averageRating,
    required this.learningPoints,
    required this.instructorNotes,
  });
}

enum CourseStatus { draft, pending, approved, published, rejected }
