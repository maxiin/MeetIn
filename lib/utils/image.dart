import 'dart:io';
import 'package:events_app/utils/colors.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File> cropImage(File image, {CropAspectRatioPreset defaultAspectRatio}) {
  if (image != null && image.path != null) {
    return null;
  }
  return ImageCropper.cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: primaryColor,
          toolbarWidgetColor: backgroundColor,
          initAspectRatio: defaultAspectRatio == null
              ? CropAspectRatioPreset.square
              : defaultAspectRatio,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      ));
}
