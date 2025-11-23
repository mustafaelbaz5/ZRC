import '../../../error/models/app_error.dart';
import '../service/auth_service.dart';

class AuthRepo {
  final AuthService _authService;

  AuthRepo({AuthService? authService})
    : _authService = authService ?? AuthService();

  /// Login user using email & password and return the role
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      // Call the service and get the role
      final role = await _authService.loginUser(
        email: email,
        password: password,
      );
      return role;
    } catch (e) {
      // Propagate AppError
      if (e is AppError) {
        rethrow;
      }
      // Convert any other exception to AppError
      throw AppError.unknown('Something went wrong. Please try again.');
    }
  }

  Future<String?> getLoggedInRole() async {
    try {
      return await _authService.getLoggedInRole();
    } catch (_) {
      return null;
    }
  }
}
