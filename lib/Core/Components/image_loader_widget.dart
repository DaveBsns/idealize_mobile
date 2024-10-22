import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../Data/Services/resource_downloader_service.dart';

class AppImageLoader extends StatelessWidget {
  final String imageId;
  final Widget? placeholder;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImageLoader({
    super.key,
    required this.imageId,
    this.placeholder,
    this.decoration,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imageId.isEmpty) {
      return placeholder ?? const SizedBox.shrink();
    }
    return FutureBuilder(
        future: ResourceDownloaderService().fetch(
          imageId,
        ),
        builder: (context, snapshot) {
          Uint8List? image;
          if (snapshot.hasData) {
            image = snapshot.data;
          }

          if (image == null) {
            return placeholder ?? const SizedBox.shrink();
          }

          final wg = Image.memory(
            image,
            width: width,
            height: height,
            fit: fit,
          );

          return Container(
            decoration: decoration ??
                const BoxDecoration(
                  shape: BoxShape.circle,
                ),
            clipBehavior: Clip.antiAlias,
            child: wg,
          );
        });
  }
}
