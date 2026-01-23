import '../../../../../../core/auth/data/repo/auth_repo.dart';
import '../../../../../../core/error/models/app_error.dart';
import '../../../../../../core/error/types/error_type.dart';
import '../../../../../../core/models/course_model.dart';
import '../../../../../../core/models/create_course_dto.dart';
import '../../../../../../core/service/course_service.dart';
import 'instructor_courses_repo.dart';

class InstructorCoursesRepoImpl implements InstructorCoursesRepo {
  final CourseService _courseService;
  final AuthRepo _authRepo;

  InstructorCoursesRepoImpl({
    required final CourseService courseService,
    required final AuthRepo authRepo,
  }) : _courseService = courseService,
       _authRepo = authRepo;

  Future<int> _getCurrentInstructorCode() async {
    final user = await _authRepo.getCurrentUser();
    if (user == null) {
      throw const AppError(
        message: 'User not authenticated',
        type: ErrorType.unauthorized,
      );
    }

    return user.studentCode;
  }

  @override
  Future<CourseModel> addCourse({required final CreateCourseDto dto}) async {
    final instructorCode = await _getCurrentInstructorCode();
    return _courseService.addCourse(dto: dto, instructorCode: instructorCode);
  }

  @override
  Future<List<CourseModel>> getInstructorCourses() async {
    final instructorCode = await _getCurrentInstructorCode();
    return _courseService.getInstructorCourses(instructorCode: instructorCode);
  }

  @override
  Future<CourseModel> updateCourse({required final CourseModel course}) async {
    final currentInstructorCode = await _getCurrentInstructorCode();
    if (course.instructorCode != currentInstructorCode) {
      throw const AppError(
        message: 'Cannot update course: not the owner',
        type: ErrorType.forbidden,
      );
    }

    return _courseService.updateCourse(course: course);
  }

  @override
  Future<void> deleteCourse({required final String courseId}) async {
    await _courseService.deleteCourse(courseId: courseId);
  }
}
