import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final photo = 'https://scontent.fcgh8-1.fna.fbcdn.net/v/t1.0-9/89514701_1083074872056637_4881692478974984192_n.jpg?_nc_cat=102&_nc_sid=85a577&_nc_ohc=HGG5G7r_uE4AX_Dl1tt&_nc_ht=scontent.fcgh8-1.fna&oh=63a685e168404f3872305ca3eeaa752f&oe=5E923DD9';

class SelectImg extends StatelessWidget {
  SelectImg();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(child: CircleAvatar(radius: 40, backgroundImage: NetworkImage(photo))),
        Center(child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: IconButton(
            icon: Icon(Icons.photo_camera, color: primaryColor),
            onPressed: () {
              var picture = await ImagePicker.pickImage(
                source: ImageSource.camera,
              );
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