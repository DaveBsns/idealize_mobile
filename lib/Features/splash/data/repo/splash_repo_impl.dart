import 'package:idealize_new_version/Features/Splash/data/data/local/splash_local_services.dart';

import '../../domain/splash_repo.dart';

class SplashRepositoryImpl implements SplashRepository {
  @override
  Future<dynamic> fetchUserFromLocalCache() async {
    return await SplashLocalServices().fetchUser();
  }
}
