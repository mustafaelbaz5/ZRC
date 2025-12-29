import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zrc/core/error/models/app_error.dart';
import 'package:zrc/core/error/types/error_handler.dart';
import 'package:zrc/core/error/types/error_type.dart';
import 'package:zrc/core/models/course_model.dart';

class CourseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Instructor Courses Service
  Future<CourseModel> addCourse({required final CourseModel course}) async {
    try {
      final response = await _supabase
          .from('courses')
          .insert(course.toJsonForInsert())
          .select()
          .maybeSingle();

      if (response == null) {
        throw const AppError(
          message: 'Failed to create course',
          type: ErrorType.unknown,
        );
      }

      return CourseModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<CourseModel>> getInstructorCourses({
    required final String instructorId,
  }) async {
    try {
      final response = await _supabase
          .from('courses')
          .select()
          .eq('instructor_id', instructorId);

      return (response as List)
          .map((final e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<CourseModel> updateCourse({required final CourseModel course}) async {
    try {
      final response = await _supabase
          .from('courses')
          .update(course.toJsonForInsert())
          .eq('id', course.id)
          .select()
          .maybeSingle();

      if (response == null) {
        throw const AppError(
          message: 'Failed to update course',
          type: ErrorType.unknown,
        );
      }

      return CourseModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> deleteCourse({required final String courseId}) async {
    try {
      await _supabase.from('courses').delete().eq('id', courseId);
    } on PostgrestException catch (e) {
      throw ErrorHandler.handle(e);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
