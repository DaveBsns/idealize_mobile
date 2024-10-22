import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart' as http;
import 'package:idealize_new_version/Core/Utils/file_utils.dart';

class CustomXFile {
  final String name;
  final String path;
  final http.MediaType mediaType;
  final bool isUploadedMedia;
  final String uploadedId;

  Color get fileColor =>
      FileUtils.fileColors[mediaType.mimeType] ?? Colors.grey;
  IconData get fileIcon =>
      FileUtils.fileIcons[mediaType.mimeType] ?? Icons.file_copy;

  CustomXFile({
    required this.name,
    required this.path,
    required this.mediaType,
    required this.uploadedId,
    this.isUploadedMedia = false,
  });
}
