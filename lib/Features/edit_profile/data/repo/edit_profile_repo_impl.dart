import 'package:idealize_new_version/Core/Data/Services/user_service.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:idealize_new_version/Features/edit_profile/data/data/local/edit_profile_local_services.dart';
import '../../../../Core/Data/Models/project_model.dart';
import '../../../../Core/Data/Services/upload_service.dart';
import '../../domain/edit_profile_repo.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  @override
  Future<Map<String, dynamic>?> updateUser(
    Map<String, dynamic> data,
  ) async {
    return await UserService().updateUserData(data);
  }

  @override
  Future<ProjectFile?> uploadFile(
    String path,
    http_parser.MediaType mediaType,
  ) async {
    return await UploadService().uploadFile(
      path: path,
      mediaType: mediaType,
    );
  }

  @override
  Future<void> updateUserInLocalCache(Map<String, dynamic> data) async {
    await EditProfileLocalServices().updateUser(data);
  }
}
