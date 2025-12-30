import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zrc/core/error/models/app_error.dart';
import 'package:zrc/core/error/types/error_handler.dart';
import 'package:zrc/core/error/types/error_type.dart';
import 'package:zrc/core/models/course_model.dart';
import 'package:zrc/core/models/create_course_dto.dart';

class CourseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  // Add new course
  Future<CourseModel> addCourse({
    required final CreateCourseDto dto,
    required final int instructorCode,
  }) async {
    try {
      final response = await _supabase
          .from('courses')
          .insert(dto.toJson(instructorCode: instructorCode))
          .select()
          .maybeSingle();

      if (response == null) {
        debugPrint('Failed to create course');
        throw const AppError(
          message: 'Failed to create course',
          type: ErrorType.unknown,
        );
      }

      return CourseModel.fromJson(response);
    } on PostgrestException catch (e) {
      debugPrint('Failed to create course: ${e.message}');
      throw ErrorHandler.handle(e);
    } catch (e) {
      debugPrint('Failed to create course: ${e.toString()}');
      throw ErrorHandler.handle(e);
    }
  }

  // Get all courses for the current instructor
  Future<List<CourseModel>> getInstructorCourses({
    required final int instructorCode,
  }) async {
    try {
      final response = await _supabase
          .from('courses')
          .select()
          .eq('instructor_code', instructorCode)
          .order('updated_at', ascending: false);

      final List<dynamic> data = response as List<dynamic>;

      return data
          .map(
            (final json) => CourseModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } on PostgrestException catch (e) {
      debugPrint('Failed to fetch instructor courses: ${e.message}');
      throw ErrorHandler.handle(e);
    } catch (e) {
      debugPrint('Unexpected error fetching courses: ${e.toString()}');
      throw ErrorHandler.handle(e);
    }
  }

  // Update existing course
  Future<CourseModel> updateCourse({required final CourseModel course}) async {
    try {
      final response = await _supabase
          .from('courses')
          .update(course.toInsertJson())
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

  // Delete course
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
