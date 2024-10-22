import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

Future<XFile> compressImage(XFile imageFile) async {
  String targetPath = path.join(
    (await getTemporaryDirectory()).path,
    '${DateTime.now().millisecondsSinceEpoch}.${path.extension(imageFile.path).substring(1)}',
  );

  CompressFormat format;

  String filePathLowercase = imageFile.path.toLowerCase();

  if (filePathLowercase.endsWith('.jpg') ||
      filePathLowercase.endsWith('.jpeg')) {
    format = CompressFormat.jpeg;
  } else if (filePathLowercase.endsWith('.png')) {
    format = CompressFormat.png;
  } else if (filePathLowercase.endsWith('.webp')) {
    format = CompressFormat.webp;
  } else {
    throw Exception(
        'Unsupported image format. Please upload a JPEG, PNG, or WEBP image.');
  }

  var result = await FlutterImageCompress.compressAndGetFile(
    imageFile.path,
    targetPath,
    quality: 88,
    format: format,
  );

  return XFile(result!.path);
}
