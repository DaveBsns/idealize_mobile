import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

Future<XFile> compressImage(XFile imageFile) async {
  String targetPath = path.join(
    (await getTemporaryDirectory()).path,
    '${DateTime.now().millisecondsSinceEpoch}.jpg',
  );

  String filePathLowercase = imageFile.path.toLowerCase();

  if (!(filePathLowercase.endsWith('.jpg') ||
      filePathLowercase.endsWith('.jpeg') ||
      filePathLowercase.endsWith('.png'))) {
    throw Exception(
        'Unsupported image format. Please upload a JPEG or PNG image.');
  }

  var result = await FlutterImageCompress.compressAndGetFile(
    imageFile.path,
    targetPath,
    quality: 70,
    format: CompressFormat.jpeg,
  );

  return XFile(result!.path);
}
