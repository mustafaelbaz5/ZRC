import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zrc/core/error/models/app_error.dart';
import 'package:zrc/core/models/course_model.dart';
import 'package:zrc/core/models/create_course_dto.dart';
import 'package:zrc/modules/instructor/features/courses/data/repo/instructor_courses_repo.dart';

part 'instructor_courses_state.dart';

class InstructorCoursesCubit extends Cubit<InstructorCoursesState> {
  final InstructorCoursesRepo _repo;

  // Local cache of courses
  List<CourseModel> _courses = [];

  InstructorCoursesCubit({required final InstructorCoursesRepo repo})
    : _repo = repo,
      super(const InstructorCoursesInitial());

  /// Load all courses for the current instructor
  Future<void> loadInstructorCourses() async {
    emit(const InstructorCoursesLoading());

    try {
      final courses = await _repo.getInstructorCourses();
      _courses = courses;
      emit(InstructorCoursesLoaded(courses: _courses));
    } catch (e) {
      final message = e is AppError ? e.message : 'Failed to load courses';
      emit(InstructorCoursesError(message: message));
    }
  }

  /// Add a new course
  Future<void> addCourse({required final CreateCourseDto dto}) async {
    if (state is InstructorCoursesLoaded || state is InstructorCoursesError) {
      emit(const InstructorCoursesLoading());
    }

    try {
      final createdCourse = await _repo.addCourse(dto: dto);

      _courses = [createdCourse, ..._courses];

      emit(InstructorCoursesLoaded(courses: _courses));
      emit(const InstructorCoursesOperationSuccess());
    } catch (e) {
      final message = e is AppError ? e.message : 'Failed to add course';
      emit(InstructorCoursesError(message: message));
    }
  }

  /// Update an existing course
  Future<void> updateCourse({required final CourseModel course}) async {
    if (state is InstructorCoursesLoaded || state is InstructorCoursesError) {
      emit(const InstructorCoursesLoading());
    }

    try {
      final updatedCourse = await _repo.updateCourse(course: course);

      final index = _courses.indexWhere((final c) => c.id == updatedCourse.id);
      if (index != -1) {
        _courses[index] = updatedCourse;
      }

      emit(InstructorCoursesLoaded(courses: _courses));
      emit(const InstructorCoursesOperationSuccess());
    } catch (e) {
      final message = e is AppError ? e.message : 'Failed to update course';
      emit(InstructorCoursesError(message: message));
    }
  }

  Future<void> deleteCourse({required final String courseId}) async {
    if (state is InstructorCoursesLoaded || state is InstructorCoursesError) {
      emit(const InstructorCoursesLoading());
    }

    try {
      await _repo.deleteCourse(courseId: courseId);

      _courses.removeWhere((final c) => c.id == courseId);

      emit(InstructorCoursesLoaded(courses: _courses));
      emit(const InstructorCoursesOperationSuccess());
    } catch (e) {
      final message = e is AppError ? e.message : 'Failed to delete course';
      emit(InstructorCoursesError(message: message));
    }
  }
}
