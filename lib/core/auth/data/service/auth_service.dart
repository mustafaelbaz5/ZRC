import 'package:bcrypt/bcrypt.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zrc/core/auth/data/model/user_model.dart';

import '../../../error/models/app_error.dart';
import '../../../error/types/error_handler.dart';
import '../../../error/types/error_type.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<UserModel> loginWithEmailPassword({
    required final String email,
    required final String password,
  }) async {
    try {
      final response = await _supabase
          .from('users')
          .select(
            'id, student_code, name, email, college, national_id, phone_number, role, password_hash',
          )
          .eq('email', email)
          .maybeSingle();

      if (response == null) {
        throw AppError(
          message: 'errors.user_not_found'.tr(),
          type: ErrorType.userNotFound,
        );
      }

      final String? storedHash = response['password_hash'] as String?;

      if (storedHash == null || storedHash.isEmpty) {
        throw AppError(
          message: 'errors.account_not_configured'.tr(),
          type: ErrorType.unknown,
        );
      }

      final bool isValid = BCrypt.checkpw(password, storedHash);

      if (!isValid) {
        throw AppError(
          message: 'errors.invalid_credentials'.tr(),
          type: ErrorType.invalidCredentials,
        );
      }

      final cleanData = Map<String, dynamic>.from(response)
        ..remove('password_hash');
      return UserModel.fromJson(cleanData);
    } on PostgrestException catch (e) {
      throw ErrorHandler.handle(e);
    } on Exception catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
