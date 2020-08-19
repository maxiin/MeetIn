import 'dart:io';

import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

enum SelectType { round, full }

class SelectImg extends StatefulWidget {
  SelectImg(
      {this.type = SelectType.round, this.canEdit = false, this.clear = false})
      : super();

  final SelectType type;
  final bool canEdit;
  final bool clear;

  @override
  SelectImgState createState() => SelectImgState();
}

class SelectImgState extends State<SelectImg> {
  File _picture;

  SelectImgState();

  @override
  Widget build(BuildContext context) {
    final height = widget.type == SelectType.round ? 80.0 : 210.0;
    final width = widget.type == SelectType.round ? 80.0 : double.infinity;
    final padding = widget.type == SelectType.round
        ? EdgeInsets.fromLTRB(16, 16, 0, 0)
        : EdgeInsets.fromLTRB(0, 0, 0, 0);

    final roundImg = Padding(
        padding: padding,
        child: CircleAvatar(
          radius: 40,
          //child: _picture == null ? SvgPicture.asset('assets/defaults/female-avatar.svg') : null,
          child: _picture == null
              ? Image.asset('assets/images/undraw_female_avatar.png')
              : null,
          backgroundImage: _picture == null ? null : FileImage(_picture),
        ));
    final fullImg = Center(
        child: _picture == null
            //? SvgPicture.asset('assets/images/preparation.svg',
            ? Image.asset('assets/images/undraw_board.png',
                width: width, height: height)
            : Image(
                image: FileImage(_picture),
                width: width,
                height: height,
              ));
    final img = widget.type == SelectType.round ? roundImg : fullImg;
    final imgRatio = widget.type == SelectType.round
        ? CropAspectRatioPreset.square
        : CropAspectRatioPreset.ratio16x9;

    Color colorTint =
        widget.type == SelectType.round ? tintColor : Colors.transparent;
    if (_picture != null || !widget.canEdit || widget.clear) {
      colorTint = transparentColor;
    }

    final border = widget.type == SelectType.round
        ? BorderRadius.all(Radius.circular(40))
        : null;

    final pickImg = () async {
      var image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      image = await cropImage(image, defaultAspectRatio: imgRatio);
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
                borderRadius: border,
              ),
              child: iconButton),
        ),
      ],
    );
  }
}
