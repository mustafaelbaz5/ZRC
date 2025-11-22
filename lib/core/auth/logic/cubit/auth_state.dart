part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String role;

  AuthSuccess({required this.role});
}

final class AuthError extends AuthState {
  final String errorMessage;
  final ErrorType? errorType;

  AuthError(this.errorMessage, {this.errorType});
}
