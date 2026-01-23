import 'course_model.dart';

class CreateCourseDto {
  final String title;
  final String description;
  final String category;
  final String youtubeUrl;
  final String? thumbnailUrl;
  final CourseStatus status;
  final List<String>? learningPoints;
  final List<String>? requirements;

  const CreateCourseDto({
    required this.title,
    required this.description,
    required this.category,
    required this.youtubeUrl,
    this.thumbnailUrl,
    this.status = CourseStatus.draft,
    this.learningPoints,
    this.requirements,
  });

  Map<String, dynamic> toJson({required final int instructorCode}) {
    return {
      'instructor_code': instructorCode,
      'title': title.trim(),
      'description': description.trim(),
      'category': category.trim(),
      'youtube_url': youtubeUrl.trim(),
      'thumbnail_url': thumbnailUrl,
      'status': status.value,
      'learning_points': (learningPoints == null || learningPoints!.isEmpty)
          ? null
          : learningPoints,
      'requirements': (requirements == null || requirements!.isEmpty)
          ? null
          : requirements,
    };
  }
}
