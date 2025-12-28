import 'package:zrc/core/auth/data/model/user_model.dart';
import 'package:zrc/core/auth/data/repo/auth_repo.dart';
import 'package:zrc/core/auth/data/service/auth_service.dart';
import 'package:zrc/core/error/models/app_error.dart';
import 'package:zrc/core/error/types/error_handler.dart';
import 'package:zrc/core/storage/secure_storage.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthService _authService;
  final SecureStorage _secureStorage;

  AuthRepoImpl({
    required final AuthService authService,
    required final SecureStorage secureStorage,
  }) : _authService = authService,
       _secureStorage = secureStorage;

  @override
  Future<UserModel> login({
    required final String email,
    required final String password,
  }) async {
    try {
      final UserModel user = await _authService.loginWithEmailPassword(
        email: email,
        password: password,
      );

      await _secureStorage.saveString(
        key: 'current_user',
        value: user.toJsonString(),
      );

      return user;
    } catch (e) {
      if (e is AppError) rethrow;
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final String? jsonString = await _secureStorage.getString(
        key: 'current_user',
      );
      if (jsonString == null || jsonString.isEmpty) return null;
      return UserModel.fromJsonString(jsonString);
    } catch (e) {
      if (e is AppError) rethrow;
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> logout() async {
    await _secureStorage.clear(key: 'current_user');
  }
}
