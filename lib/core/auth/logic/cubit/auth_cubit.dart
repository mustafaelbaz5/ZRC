import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../error/models/app_error.dart';
import '../../../error/types/error_type.dart';
import '../../data/repo/auth_repo.dart';

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
      final role = await _authRepo.login(email: email, password: password);

      emit(AuthSuccess(role: role));
    } on AppError catch (e) {
      emit(AuthError(e.message, errorType: e.type));
    } catch (_) {
      emit(AuthError('Something went wrong. Please try again.'));
    }
  }

  Future<void> checkAutoLogin() async {
    emit(AuthLoading());
    try {
      final role = await _authRepo.getLoggedInRole();
      if (role != null) {
        emit(AuthSuccess(role: role));
      } else {
        emit(AuthInitial()); // not logged in
      }
    } catch (_) {
      emit(AuthInitial());
    }
  }
}
