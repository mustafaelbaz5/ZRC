import 'package:zrc/core/models/course_model.dart';

abstract class InstructorCoursesRepo {
  Future<CourseModel> addCourse({required final CourseModel course});

  Future<List<CourseModel>> getInstructorCourses();

  Future<CourseModel> updateCourse({required final CourseModel course});

  Future<void> deleteCourse({required final String courseId});
}
