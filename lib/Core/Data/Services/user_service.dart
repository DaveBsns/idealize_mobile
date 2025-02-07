import 'package:idealize_new_version/Core/Data/Models/user_model.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/app_repo.dart';

import './services_helper.dart';

class UserService extends ServicesHelper {
  Future<List<User>> fetchAllUsers() async {
    final mappedData = await request(
      '$baseURL/users',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return mappedData != null
        ? [for (final mappedUsers in mappedData) User.fromJson(mappedUsers)]
        : [];
  }

  Future<Map<String, dynamic>?> updateUserData(
      Map<String, dynamic> userData) async {
    final mappedData = await request(
      '$baseURL/users',
      serviceType: ServiceType.put,
      body: userData,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>> getUserData() async {
    final mappedData = await request(
      '$baseURL/users/${AppRepo().user!.id}',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>> getAnotherUserData(String userId) async {
    final mappedData = await request(
      '$baseURL/users/$userId',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>?> softDeleteUserRequest() async {
    final mappedData = await request(
      '$baseURL/users/soft-delete-request',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>?> softAnanymizedDeleteUserRequest() async {
    final mappedData = await request(
      '$baseURL/users/soft-anonymized-delete-request',
      serviceType: ServiceType.delete,
      requiredDefaultHeader: true,
    );

    return mappedData;
  }

  Future<Map<String, dynamic>?> verifyDelete(String code) async {
    final mappedData = await request(
      '$baseURL/users/verify-soft-delete',
      serviceType: ServiceType.delete,
      body: {
        'code': code,
      },
      requiredDefaultHeader: true,
    );

    return mappedData;
  }
}
