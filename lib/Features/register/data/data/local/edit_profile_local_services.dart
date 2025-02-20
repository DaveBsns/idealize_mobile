import 'dart:convert';

import 'package:idealize_new_version/Core/Data/LocalCache/local_secure_cache_helper.dart';

import '../../../../../Core/Constants/local_cache_keys.dart';

class EditProfileLocalServices extends LocalSecureCacheHelper {
  Future<void> updateUser(Map<String, dynamic> updatedUserData) async {
    await LocalSecureCacheHelper()
        .write(LocalSecureCacheKeys().userObject, jsonEncode(updatedUserData));
  }
}
