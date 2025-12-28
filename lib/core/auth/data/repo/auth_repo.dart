import 'package:zrc/core/auth/data/model/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> login({
    required final String email,
    required final String password,
  });
  Future<UserModel?> getCurrentUser();
  Future<void> logout();
}
