import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureCacheHelper {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future<void> write(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    try {
      return await storage.read(key: key);
    } catch (_) {
      return null;
    }
  }

  Future<void> clear() async {
    await storage.deleteAll();
  }
}
