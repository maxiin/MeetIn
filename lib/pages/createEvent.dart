import 'package:events_app/components/bigButton.dart';
import 'package:events_app/components/dateCard.dart';
import 'package:events_app/components/selectImg.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:events_app/utils/validation.dart';
import 'package:flutter/material.dart';

final photo = 'https://scontent.fcgh8-1.fna.fbcdn.net/v/t1.0-9/89514701_1083074872056637_4881692478974984192_n.jpg?_nc_cat=102&_nc_sid=85a577&_nc_ohc=HGG5G7r_uE4AX_Dl1tt&_nc_ht=scontent.fcgh8-1.fna&oh=63a685e168404f3872305ca3eeaa752f&oe=5E923DD9';

class CreateEvent extends StatelessWidget {
  CreateEvent() : super();

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    final header = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(backgroundImage: NetworkImage(photo)),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText('Event Creation'),
            ClearText('Maxiine Costa'),
          ],
        ),
      ],
    );

    final imageHeader = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 8),
      child: TitleText('Logo!'),
    );

    final infoHeader = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 8),
      child: TitleText('Infos ==>'),
    );

    final nameInput = Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        validator: validateEmail,
        decoration: inputStyle(hint: 'Title'),
      )
    );

    final descriptionInput = Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextFormField(
        validator: validateEmail,
        decoration: inputStyle(hint: 'Description'),
        maxLines: 4,
      )
    );

    final dateHeader = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 8),
      child: TitleText('When?'),
    );

    final dateInput = Row(
      children: <Widget>[
        DateCard(date: DateTime.now(), onPressed: null, showHour: true),
        Expanded(child: BigButton(title: 'Change Date', color: secondaryColor, description: 'All day events available', onPressed: () {},))
      ],
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {},
        padding: EdgeInsets.all(12),
        color: primaryColor,
        child: ButtonText('Save'),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 44),
        children: <Widget>[
          header,
          // welcomeText,
          SizedBox(height: 48.0),
          Form(
            key: form,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                imageHeader,
                SelectImg(),
                // Stack(
                //   children: <Widget>[
                //       Center(child: CircleAvatar(radius: 40, backgroundImage: NetworkImage(photo))),
                //       Center(child: Container(
                //         width: 80,
                //         height: 80,
                //         decoration: BoxDecoration(
                //           color: tint,
                //           borderRadius: BorderRadius.all(Radius.circular(40)),
                //         ),
                //         child: Center(
                //           child: Icon(Icons.photo_camera, color: Colors.white)
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 16.0),
                infoHeader,
                nameInput,
                descriptionInput,
                dateHeader,
                dateInput,
                SizedBox(height: 16.0),
                loginButton,
              ],
            ),
          ),
          // forgotLabel
        ],
      ),
    );
  }
}