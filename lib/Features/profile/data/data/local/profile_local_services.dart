import 'dart:convert';

import '../../../../../Core/Constants/local_cache_keys.dart';
import '../../../../../Core/Data/LocalCache/local_secure_cache_helper.dart';

class ProfileLocalServices extends LocalSecureCacheHelper {
  Future<void> updateUser(Map<String, dynamic> updatedUserData) async {
    await write(LocalSecureCacheKeys().userObject, jsonEncode(updatedUserData));
  }
}
