import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zrc/core/error/models/app_error.dart';
import 'package:zrc/core/models/course_model.dart';
import 'package:zrc/modules/instructor/features/courses/data/repo/instructor_courses_repo.dart';

part 'instructor_courses_state.dart';

class InstructorCoursesCubit extends Cubit<InstructorCoursesState> {
  final InstructorCoursesRepo _repo;

  InstructorCoursesCubit({required final InstructorCoursesRepo repo})
    : _repo = repo,
      super(InstructorCoursesInitial());

  /// Add a new course
  Future<void> addCourse(final CourseModel course) async {
    emit(InstructorCoursesLoading());
    try {
      final addedCourse = await _repo.addCourse(course: course);
      emit(InstructorCourseOperationSuccess(course: addedCourse));
    } catch (e) {
      final message = e is AppError ? e.message : e.toString();
      emit(InstructorCoursesError(message: message));
    }
  }

  /// Fetch all courses for the instructor
  Future<void> getInstructorCourses() async {
    emit(InstructorCoursesLoading());
    try {
      final courses = await _repo.getInstructorCourses();
      emit(InstructorCoursesLoaded(courses: courses));
    } catch (e) {
      final message = e is AppError ? e.message : e.toString();
      emit(InstructorCoursesError(message: message));
    }
  }

  /// Update an existing course
  Future<void> updateCourse(final CourseModel course) async {
    emit(InstructorCoursesLoading());
    try {
      final updatedCourse = await _repo.updateCourse(course: course);
      emit(InstructorCourseOperationSuccess(course: updatedCourse));
    } catch (e) {
      final message = e is AppError ? e.message : e.toString();
      emit(InstructorCoursesError(message: message));
    }
  }

  /// Delete a course
  Future<void> deleteCourse(final String courseId) async {
    emit(InstructorCoursesLoading());
    try {
      await _repo.deleteCourse(courseId: courseId);
      emit(InstructorCourseOperationSuccess(deletedCourseId: courseId));
    } catch (e) {
      final message = e is AppError ? e.message : e.toString();
      emit(InstructorCoursesError(message: message));
    }
  }
}
