import 'package:idealize_new_version/Features/authentication/data/remote/authentication_service.dart';
import 'package:idealize_new_version/Features/authentication/domain/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final service = AuthenticationService();

  @override
  Future<Map<String, dynamic>?> login(
      {required String username, required String password}) async {
    return await service.login({
      'email': username,
      'password': password,
    });
  }

  @override
  Future<Map<String, dynamic>?> verifyAccount({
    required String email,
    required String code,
  }) async {
    return await AuthenticationService().verify(
      code: code,
      email: email,
    );
  }
}
