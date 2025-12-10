import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../error/models/app_error.dart';
import '../../../error/types/error_handler.dart';
import '../../../error/types/error_type.dart';
import '../../../storage/user_storage.dart';
import '../model/user_model.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final UserStorage _userStorage;

  AuthService({final UserStorage? userStorage})
    : _userStorage = userStorage ?? UserStorage();

  /// Login user using email & password and return the full UserModel
  Future<UserModel> loginUser({
    required final String email,
    required final String password,
  }) async {
    try {
      // Fetch user from Supabase
      final PostgrestMap? response = await _supabase
          .from('students')
          .select(
            'id, student_code, name, email, password, college, national_id, phone_number, role',
          )
          .eq('email', email)
          .maybeSingle();

      if (response == null) {
        throw const AppError(
          message: 'Email not registered',
          type: ErrorType.invalidCredentials,
        );
      }

      final String? storedPassword = response['password'] as String?;
      if (storedPassword != password) {
        throw const AppError(
          message: 'Incorrect password',
          type: ErrorType.invalidCredentials,
        );
      }

      // Build UserModel
      final UserModel user = UserModel.fromJson(response);

      // Save full user data in secure storage via UserStorage
      await _userStorage.saveUser(user);

      debugPrint(
        '✅ User logged in successfully: ${user.id}, role: ${user.role}',
      );

      return user;
    } catch (e) {
      final AppError appError = ErrorHandler.handle(e);
      debugPrint('❌ Login failed: ${appError.message}');
      throw AppError(
        message: appError.message,
        type: appError.type,
        code: appError.code,
        originalError: appError.originalError,
      );
    }
  }

  Future<void> logout() async {
    await _userStorage.clearUser();
  }
}
