import 'package:idealize_new_version/Core/Data/LocalCache/local_secure_cache_helper.dart';

import '../../../../../Core/Constants/local_cache_keys.dart';

class SplashLocalServices extends LocalSecureCacheHelper {
  Future<dynamic> fetchUser() async {
    return await read(LocalSecureCacheKeys().userObject);
  }
}
