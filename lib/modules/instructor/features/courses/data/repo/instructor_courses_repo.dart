import 'package:zrc/core/models/course_model.dart';
import 'package:zrc/core/models/create_course_dto.dart';

abstract class InstructorCoursesRepo {
  Future<CourseModel> addCourse({required final CreateCourseDto dto});
  Future<List<CourseModel>> getInstructorCourses();
  Future<CourseModel> updateCourse({required final CourseModel course});
  Future<void> deleteCourse({required final String courseId});
}
