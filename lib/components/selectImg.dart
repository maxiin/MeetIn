import 'dart:io';

import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:events_app/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum SelectType { round, full }

class SelectCircleImg extends StatefulWidget {
  SelectCircleImg({this.canEdit = false, this.clear = false}) : super();

  final bool canEdit;
  final bool clear;

  @override
  SelectCircleImgState createState() => SelectCircleImgState();
}

class SelectCircleImgState extends State<SelectCircleImg> {
  File _picture;

  SelectCircleImgState();

  @override
  Widget build(BuildContext context) {
    final height = 80.0;
    final width = 80.0;
    final padding = EdgeInsets.fromLTRB(16, 16, 0, 0);

    final img = Padding(
        padding: padding,
        child: CircleAvatar(
          radius: 40,
          child: _picture == null
              ? Image.asset('assets/images/undraw_female_avatar.png')
              : null,
          backgroundImage: _picture == null ? null : FileImage(_picture),
        ));

    Color colorTint = tintColor;
    if (_picture != null || !widget.canEdit || widget.clear) {
      colorTint = transparentColor;
    }

    final pickImg = () async {
      var image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      image = await cropImage(image,
          defaultAspectRatio: CropAspectRatioPreset.square);
      setState(() {
        _picture = image;
      });
    };
    final photoButton = IconButton(
        icon: Icon(Icons.photo_camera, color: primaryColor),
        onPressed: pickImg);
    final iconButton = widget.canEdit ? photoButton : null;

    return Stack(
      children: <Widget>[
        img,
        Padding(
          padding: padding,
          child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: colorTint,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: iconButton),
        ),
      ],
    );
  }
}

class SelectFullImg extends StatefulWidget {
  SelectFullImg({this.canEdit = false, this.clear = false}) : super();

  final bool canEdit;
  final bool clear;

  @override
  SelectFullImgState createState() => SelectFullImgState();
}

class SelectFullImgState extends State<SelectFullImg> {
  File _picture;

  SelectFullImgState();

  @override
  Widget build(BuildContext context) {
    final height = selectImgFullHeight;
    final width = double.infinity;
    final padding = EdgeInsets.fromLTRB(0, 0, 0, 0);

    final fullImg = Center(
        child: _picture == null
            ? Image.asset(
                'assets/images/undraw_board.png',
                width: width,
                height: height,
                fit: BoxFit.cover,
              )
            : Image(
                image: FileImage(_picture),
                width: width,
                height: height,
                fit: BoxFit.contain,
              ));
    final img = fullImg;

    final pickImg = () async {
      var image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      image = await cropImage(image,
          defaultAspectRatio: CropAspectRatioPreset.ratio16x9);
      setState(() {
        _picture = image;
      });
    };
    final photoButton = IconButton(
        icon: Icon(Icons.photo_camera, color: primaryColor),
        onPressed: pickImg);
    final iconButton = widget.canEdit ? photoButton : null;

    return Stack(
      children: <Widget>[
        img,
        Padding(
          padding: padding,
          child: Container(width: width, height: height, child: iconButton),
        ),
      ],
    );
  }
}
