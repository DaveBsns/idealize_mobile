import 'package:idealize_new_version/Core/Data/Models/tag_model.dart';
import 'package:idealize_new_version/Core/Data/Services/services_helper.dart';
import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/app_repo.dart';

class TagService extends ServicesHelper {
  Future<List<Tag>> fetchAllTags() async {
    final mappedData = await request(
      '$baseURL/tags',
      serviceType: ServiceType.get,
      requiredDefaultHeader: false,
    );

    return mappedData != null
        ? [for (final mappedProject in mappedData) Tag.fromJson(mappedProject)]
        : [];
  }

  Future<Tag> addNewTag(
    String tagName, {
    String type = 'tag',
  }) async {
    final mappedData = await request('$baseURL/tags/new',
        serviceType: ServiceType.post,
        requiredDefaultHeader: true,
        body: {
          'name': tagName,
          'type': type,
          'userId': AppRepo().user?.id,
        });

    return Tag.fromJson(mappedData);
  }
}
