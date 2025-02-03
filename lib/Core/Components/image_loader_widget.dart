import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idealize_new_version/Core/Constants/config.dart';
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

showImageFromNetwork(
  String imageId, {
  double? width,
  double? height,
  Widget? placeholder,
  BoxFit fit = BoxFit.cover,
}) {
  return CachedNetworkImage(
    imageUrl: '${AppConfig().baseURL}/uploads/resource/$imageId',
    width: width,
    height: height,
    fit: fit,
    errorWidget: (context, url, error) => const Icon(Icons.error),
    placeholder: (context, url) => placeholder ?? const SizedBox.shrink(),
  );
}
