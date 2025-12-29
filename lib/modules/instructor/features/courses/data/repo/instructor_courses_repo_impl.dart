import 'package:zrc/core/auth/data/repo/auth_repo.dart';
import 'package:zrc/core/error/models/app_error.dart';
import 'package:zrc/core/error/types/error_type.dart';
import 'package:zrc/core/models/course_model.dart';
import 'package:zrc/core/service/course_service.dart';
import 'package:zrc/modules/instructor/features/courses/data/repo/instructor_courses_repo.dart';

class InstructorCoursesRepoImpl implements InstructorCoursesRepo {
  final CourseService _courseService;
  final AuthRepo _authRepo;

  InstructorCoursesRepoImpl({
    required final CourseService courseService,
    required final AuthRepo authRepo,
  }) : _courseService = courseService,
       _authRepo = authRepo;

  /// Get current instructor ID from the stored user
  Future<int> _getInstructorId() async {
    final user = await _authRepo.getCurrentUser();
    if (user == null) {
      throw const AppError(
        message: 'User not logged in',
        type: ErrorType.unauthorized,
      );
    }
    return user.id;
  }

  @override
  Future<CourseModel> addCourse({required final CourseModel course}) async {
    final instructorId = await _getInstructorId();
    final courseWithInstructor = course.copyWith(
      instructorId: instructorId.toString(),
    );
    return _courseService.addCourse(course: courseWithInstructor);
  }

  @override
  Future<List<CourseModel>> getInstructorCourses() async {
    final instructorId = await _getInstructorId();
    return _courseService.getInstructorCourses(
      instructorId: instructorId.toString(),
    );
  }

  @override
  Future<CourseModel> updateCourse({required final CourseModel course}) async {
    return _courseService.updateCourse(course: course);
  }

  @override
  Future<void> deleteCourse({required final String courseId}) async {
    return _courseService.deleteCourse(courseId: courseId);
  }
}
