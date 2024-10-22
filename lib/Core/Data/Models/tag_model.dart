import 'package:idealize_new_version/Core/Utils/enums.dart';
import 'package:idealize_new_version/Core/Utils/extensions.dart';

class Tag {
  final String id;
  final String tagName;
  final TagType type;

  Tag({required this.id, required this.tagName, required this.type});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json["_id"],
      tagName: json['name'],
      type: json['type'].toString().toTagType,
    );
  }
}
