part of 'instructor_courses_cubit.dart';

@immutable
abstract class InstructorCoursesState {}

class InstructorCoursesInitial extends InstructorCoursesState {}

class InstructorCoursesLoading extends InstructorCoursesState {}

class InstructorCoursesLoaded extends InstructorCoursesState {
  final List<CourseModel> courses;
  InstructorCoursesLoaded({required this.courses});
}

/// Success state for add/update/delete operations
class InstructorCourseOperationSuccess extends InstructorCoursesState {
  final CourseModel? course;
  final String? deletedCourseId;

  InstructorCourseOperationSuccess({this.course, this.deletedCourseId});
}

class InstructorCoursesError extends InstructorCoursesState {
  final String message;
  InstructorCoursesError({required this.message});
}
