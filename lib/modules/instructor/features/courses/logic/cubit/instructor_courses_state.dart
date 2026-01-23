part of 'instructor_courses_cubit.dart';

@immutable
sealed class InstructorCoursesState {
  const InstructorCoursesState();
}

final class InstructorCoursesInitial extends InstructorCoursesState {
  const InstructorCoursesInitial();
}

final class InstructorCoursesLoading extends InstructorCoursesState {
  const InstructorCoursesLoading();
}

final class InstructorCoursesLoaded extends InstructorCoursesState {
  final List<CourseModel> courses;

  const InstructorCoursesLoaded({required this.courses});
}

final class InstructorCoursesOperationSuccess extends InstructorCoursesState {
  const InstructorCoursesOperationSuccess();
}

final class InstructorCoursesError extends InstructorCoursesState {
  final String message;

  const InstructorCoursesError({required this.message});
}
