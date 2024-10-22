import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:idealize_new_version/Core/Data/Models/project_model.dart';

import './services_helper.dart';

class UploadService extends ServicesHelper {
  Future<ProjectFile?> uploadFile({
    required String path,
    required http_parser.MediaType mediaType,
  }) async {
    final mappedData = await uploadRequest(
      '$baseURL/uploads/new',
      filePath: path,
      mediaType: mediaType,
      requiredDefaultHeader: true,
    );
    if (mappedData != null) {
      return ProjectFile.fromJson(mappedData);
    }
    return null;
  }
}
