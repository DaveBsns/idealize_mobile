import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

abstract class EditProfileRepository {
  Future<Map<String, dynamic>?> updateUser(
    Map<String, dynamic> data,
  );

  Future<ProjectFile?> uploadFile(
    String path,
    http_parser.MediaType mediaType,
  );

  Future<void> updateUserInLocalCache(
    Map<String, dynamic> data,
  );
}
