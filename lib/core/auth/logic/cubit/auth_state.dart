part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel userModel;

  AuthSuccess({required this.userModel});
}

final class AuthError extends AuthState {
  final String errorMessage;
  final ErrorType? errorType;

  AuthError(this.errorMessage, {this.errorType});
}
