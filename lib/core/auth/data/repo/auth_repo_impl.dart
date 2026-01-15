import '../model/user_model.dart';
import 'auth_repo.dart';
import '../service/auth_service.dart';
import '../../../config/constants.dart';
import '../../../error/models/app_error.dart';
import '../../../error/types/error_handler.dart';
import '../../../storage/secure_storage.dart';

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
        key: Constants.userStorageKey,
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
        key: Constants.userStorageKey,
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
    await _secureStorage.clear(key: Constants.userStorageKey);
  }
}
