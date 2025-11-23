import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zrc/core/error/types/error_type.dart';

import '../../../error/models/app_error.dart';
import '../../../error/types/error_handler.dart';
import '../../../utils/secure_storage.dart';

class AuthService {
  final _supabase = Supabase.instance.client;
  final _secureStorage = SecureStorage();

  /// Logs in the user using your custom students table and returns the role
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Check if the email exists and get role
      final emailResponse = await _supabase
          .from('students')
          .select('id, student_code, password, role')
          .eq('email', email)
          .maybeSingle(); // returns null if no record found

      if (emailResponse == null) {
        throw const AppError(
          message: 'Email not registered',
          type: ErrorType.invalidCredentials,
        );
      }

      // Check if the password matches
      final storedPassword = emailResponse['password'] as String?;
      if (storedPassword != password) {
        throw const AppError(
          message: 'Incorrect password',
          type: ErrorType.invalidCredentials,
        );
      }

      // Save user info in secure storage
      final studentId = emailResponse['id'];
      final studentCode = emailResponse['student_code'];
      final role = emailResponse['role'] as String? ?? 'student';

      await _secureStorage.saveString(
        key: 'user_id',
        value: studentId.toString(),
      );
      await _secureStorage.saveString(
        key: 'student_code',
        value: studentCode.toString(),
      );
      await _secureStorage.saveString(key: 'role', value: role);

      debugPrint('✅ User logged in successfully: $studentId, role: $role');

      // Return the role
      return role;
    } catch (e) {
      final appError = ErrorHandler.handle(e);
      debugPrint('❌ Login failed: ${appError.message}');
      throw AppError(
        message: appError.message,
        type: appError.type,
        code: appError.code,
        originalError: appError.originalError,
      );
    }
  }

  Future<String?> getLoggedInRole() async {
    try {
      final role = await _secureStorage.getString(key: 'role');
      final userId = await _secureStorage.getString(key: 'user_id');
      if (role != null && userId != null) {
        return role;
      }
      return null;
    } catch (e) {
      debugPrint('Error checking login: $e');
      return null;
    }
  }
}
