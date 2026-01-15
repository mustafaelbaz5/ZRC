import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/auth_repo.dart';
import '../../../error/models/app_error.dart';
import '../../../error/types/error_type.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> login({
    required final String email,
    required final String password,
  }) async {
    emit(AuthLoading());

    try {
      final user = await _authRepo.login(email: email, password: password);
      emit(AuthSuccess(userModel: user));
    } on AppError catch (appError) {
      emit(AuthError(appError.message, errorType: appError.type));
    } catch (_) {
      emit(
        AuthError(
          'An unexpected error occurred. Please try again.',
          errorType: ErrorType.unknown,
        ),
      );
    }
  }

  Future<void> checkCurrentUser() async {
    emit(AuthLoading());

    try {
      final user = await _authRepo.getCurrentUser();

      if (user != null) {
        emit(AuthSuccess(userModel: user));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthInitial());
    }
  }

  Future<void> logout() async {
    await _authRepo.logout();
    emit(AuthInitial());
  }
}
