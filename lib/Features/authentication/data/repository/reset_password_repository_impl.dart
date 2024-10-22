import 'package:idealize_new_version/Features/authentication/data/remote/authentication_service.dart';

import '../../domain/reset_password_repository.dart';

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
  @override
  Future<Map<String, dynamic>?> resetPasswordRequest(String email) async {
    return await AuthenticationService().resetPasswordRequest(email: email);
  }

  @override
  Future<Map<String, dynamic>?> resetPasswordVerify(
      String email, String code, String newPassword) async {
    return await AuthenticationService().resetPasswordVerify(
      email: email,
      newPassword: newPassword,
      code: code,
    );
  }
}
