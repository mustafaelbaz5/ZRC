import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../auth/data/model/user_model.dart';
import '../storage/secure_storage.dart';

class UserStorage {
  static const String _keyUser = 'logged_in_user';
  final SecureStorage _secureStorage;

  UserStorage({final SecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? SecureStorage();

  /// Save the full user object
  Future<void> saveUser(final UserModel user) async {
    final String jsonString = jsonEncode(user.toJson());
    await _secureStorage.saveString(key: _keyUser, value: jsonString);
  }

  /// Fetch the full user object from secure storage
  Future<UserModel?> getUser() async {
    try {
      final String? jsonString = await _secureStorage.getString(key: _keyUser);
      if (jsonString == null) return null;
      return UserModel.fromJson(jsonDecode(jsonString));
    } catch (e) {
      debugPrint('Error fetching user data from secure storage: $e');
      return null;
    }
  }

  /// Clear the stored user data
  Future<void> clearUser() async {
    await _secureStorage.clear(key: _keyUser);
  }
}
