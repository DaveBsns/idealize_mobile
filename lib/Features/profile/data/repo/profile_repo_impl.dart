import 'package:idealize_new_version/Core/Data/Services/user_service.dart';

import '../../domain/profile_repo.dart';
import '../data/local/profile_local_services.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<Map<String, dynamic>?> updateUser(
    Map<String, dynamic> userData,
  ) async {
    return await UserService().updateUserData(userData);
  }

  @override
  Future<void> updateUserInLocalCache(
    Map<String, dynamic> userData,
  ) async {
    await ProfileLocalServices().updateUser(userData);
  }
}
