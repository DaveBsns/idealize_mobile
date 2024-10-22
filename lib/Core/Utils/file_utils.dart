/// The `FileUtils` class contains two static properties:
///
/// * `fileColors`: A map that associates file extensions with their corresponding colors.
///   This map is used to get the color for a file based on its extension.
///
/// * `fileIcons`: A map that associates file extensions with their corresponding icons.
///   This map is used to get the icon for a file based on its extension.
library;

import 'package:flutter/material.dart';

class FileUtils {
  static const Map<String, IconData> fileIcons = {
    'application/pdf': Icons.picture_as_pdf,
    'application/doc': Icons.description,
    'application/docx': Icons.description,
    'application/ppt': Icons.slideshow,
    'application/pptx': Icons.slideshow,
    'image/jpg': Icons.image,
    'image/jpeg': Icons.image,
    'image/webp': Icons.image,
    'image/png': Icons.image,
    'image/gif': Icons.gif,
    'video/mp4': Icons.videocam,
    'video/mov': Icons.videocam,
    'video/avi': Icons.videocam,
    'video/mkv': Icons.videocam,
  };

  static const Map<String, Color> fileColors = {
    'application/pdf': Colors.red,
    'application/doc': Colors.blue,
    'application/docx': Colors.blue,
    'application/ppt': Colors.orange,
    'application/pptx': Colors.orange,
    'image/jpg': Colors.green,
    'image/jpeg': Colors.green,
    'image/png': Colors.green,
    'image/gif': Colors.teal,
    'video/mp4': Colors.purple,
    'video/mov': Colors.purple,
    'video/avi': Colors.purple,
    'video/mkv': Colors.purple,
  };

  static bool isMediaFile(String mimeType) {
    return [
      'image/webp',
      'image/jpg',
      'image/jpeg',
      'image/png',
      'image/gif',
      'video/mp4',
      'video/mov',
      'video/avi',
      'video/mkv',
    ].contains(mimeType);
  }
}
