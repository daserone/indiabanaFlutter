// import 'dart:developer';
// import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as p;

Future<XFile?> pickerImageCamera() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: ImageSource.camera,
  );
  if (image == null) return null;

  // final Uint8List imageByte = await image.readAsBytes();

  // final String typeImage = p.extension(image.path).replaceAll('.', '');
  // final Uri uriParsed = Uri.dataFromBytes(
  //   imageByte,
  //   mimeType: 'image/$typeImage',
  // );

  return image;
}

Future<XFile?> pickerImageGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: ImageSource.gallery,
  );
  if (image == null) return null;

  // final Uint8List imageByte = await image.readAsBytes();

  // final String typeImage = p.extension(image.path).replaceAll('.', '');
  // final Uri uriParsed = Uri.dataFromBytes(
  //   imageByte,
  //   mimeType: 'image/$typeImage',
  // );

  // return uriParsed.toString();
  return image;
}

Future<List<XFile>?> pickerMultiImage() async {
  List<XFile> imagesSelected = [];
  final ImagePicker picker = ImagePicker();
  final List<XFile> images = await picker.pickMultiImage();

  for (XFile img in images) {
    // final Uint8List imageByte = await img.readAsBytes();
    // final String typeImage = p.extension(img.path).replaceAll('.', '');
    // final Uri uriParsed = Uri.dataFromBytes(
    //   imageByte,
    //   mimeType: 'image/$typeImage',
    // );
    // log(uriParsed.toString());
    imagesSelected.add(img);
  }

  return imagesSelected;
}
