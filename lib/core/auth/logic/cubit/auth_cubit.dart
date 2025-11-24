import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/auth_repo.dart';
import '../../../error/models/app_error.dart';
import '../../../error/types/error_type.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit({AuthRepo? authRepo})
    : _authRepo = authRepo ?? AuthRepo(),
      super(AuthInitial());

  /// Login method
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final studentModel = await _authRepo.login(
        email: email,
        password: password,
      );
      emit(AuthSuccess(userModel: studentModel));
    } on AppError catch (e) {
      emit(AuthError(e.message, errorType: e.type));
    } catch (_) {
      emit(AuthError('Something went wrong. Please try again.'));
    }
  }

  /// Check if user is already logged in (from storage)
  Future<void> checkAutoLogin() async {
    emit(AuthLoading());
    try {
      final studentModel = await _authRepo.getLoggedInStudent();
      if (studentModel != null) {
        emit(AuthSuccess(userModel: studentModel));
      } else {
        emit(AuthInitial());
      }
    } catch (_) {
      emit(AuthInitial());
    }
  }

  /// Logout method
  Future<void> logout() async {
    await _authRepo.logout();
    emit(AuthInitial());
  }
}
