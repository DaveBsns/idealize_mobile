import 'dart:typed_data';

import 'package:idealize_new_version/Core/Data/Services/services_helper.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';

class ResourceDownloaderService extends ServicesHelper {
  Future<Uint8List?> fetch(String attachmentId) async {
    final response = await request(
      '$baseURL/uploads/resource/$attachmentId',
      serviceType: ServiceType.get,
      requiredDefaultHeader: true,
      isFile: true,
    );
    return response;
  }
}
