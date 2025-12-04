import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> saveString({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getString({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> clear({required String key}) async {
    await _storage.delete(key: key);
  }
}
