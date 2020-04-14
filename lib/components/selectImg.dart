import 'dart:io';

import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class SelectImg extends StatefulWidget {
  SelectImg() : super();

  @override
  SelectImgState createState() => SelectImgState();
}

class SelectImgState extends State<SelectImg> {
  File _picture;

  SelectImgState();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(child: CircleAvatar(radius: 40, child: _picture == null ? SvgPicture.asset('assets/defaults/female-avatar.svg') : FileImage(_picture) )),
        Center(child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: IconButton(
            icon: Icon(Icons.photo_camera, color: primaryColor),
            onPressed: () async{
              var image = await ImagePicker.pickImage(
                source: ImageSource.gallery,
              );
              image = await cropImage(image);
              setState(() {
                _picture = image;
              });
            }
          ),
        ),
        ),
      ],
    );
  }
}

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// class SelectImage extends StatefulWidget {
//   final CameraDescription camera;

//   const SelectImage({Key key, @required this.camera,}) : super(key: key);

//   @override
//   SelectImageState createState() => SelectImageState();
// }

// class SelectImageState extends State<SelectImage> {
//   CameraController _controller;
//   Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.medium,
//     );

//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       onPressed: () async {
//         // Take the Picture in a try / catch block. If anything goes wrong,
//         // catch the error.
//         try {
//           // Ensure that the camera is initialized.
//           await _initializeControllerFuture;

//           // Construct the path where the image should be saved using the
//           // pattern package.
//           final path = join(
//             // Store the picture in the temp directory.
//             // Find the temp directory using the `path_provider` plugin.
//             (await getTemporaryDirectory()).path,
//             '${DateTime.now()}.png',
//           );

//           // Attempt to take a picture and log where it's been saved.
//           await _controller.takePicture(path);

//           // If the picture was taken, display it on a new screen.
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => DisplayPictureScreen(imagePath: path),
//           //   ),
//           // );
//         } catch (e) {
//           // If an error occurs, log the error to the console.
//           print(e);
//         }
//       },
//       child: null
//     );
//   }
  
// }