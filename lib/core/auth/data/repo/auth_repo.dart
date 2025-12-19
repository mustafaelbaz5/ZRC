import '../../../error/models/app_error.dart';
import '../../../storage/secure_storage.dart';
import '../model/user_model.dart';
import '../service/auth_service.dart';

class AuthRepo {
  final AuthService _authService;
  final SecureStorage _secureStorage;

  AuthRepo({final AuthService? authService, final SecureStorage? secureStorage})
    : _authService = authService ?? AuthService(),
      _secureStorage = secureStorage ?? SecureStorage();

  /// Login user using email & password and return the full StudentModel
  Future<UserModel> login({
    required final String email,
    required final String password,
  }) async {
    try {
      final UserModel student = await _authService.loginUser(
        email: email,
        password: password,
      );

      // Store full student data in secure storage
      await _secureStorage.saveString(
        key: 'student_data',
        value: student.toJsonString(),
      );

      return student;
    } catch (e) {
      if (e is AppError) {
        rethrow;
      }
      throw AppError.unknown('Something went wrong. Please try again.');
    }
  }

  /// Get logged-in student from secure storage
  Future<UserModel?> getLoggedInStudent() async {
    try {
      final String? jsonString = await _secureStorage.getString(
        key: 'student_data',
      );
      if (jsonString == null) return null;

      return UserModel.fromJsonString(jsonString);
    } catch (_) {
      return null;
    }
  }

  /// Clear logged-in student data
  Future<void> logout() async {
    await _secureStorage.clear(key: 'student_data');
  }
}
