import 'dart:async';

import 'package:events_app/components/big_button.dart';
import 'package:events_app/components/date-card.dart';
import 'package:events_app/components/select-image.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:events_app/utils/maps.dart';
import 'package:events_app/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

final CameraPosition kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

final CameraPosition kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414);

class CreateEvent extends StatefulWidget {
  CreateEvent() : super();

  @override
  CreateEventState createState() => CreateEventState();
}

class CreateEventState extends State<CreateEvent> {
  GoogleMapController _controller;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  Completer<GoogleMapController> _mapsCompleter = Completer();
  Position _position = Position(latitude: 0, longitude: 0);
  final form = GlobalKey<FormState>();

  CreateEventState() {
    loadLocation();
  }

  loadLocation() async {
    Position newPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _position = newPosition;
      _controller.animateCamera(CameraUpdate.newLatLng(
          new LatLng(newPosition.latitude, newPosition.longitude)));
      _markers[new MarkerId('center')] = new Marker(
          markerId: new MarkerId("center"),
          position: LatLng(newPosition.latitude, newPosition.longitude));
    });
  }

  changeLocation(LatLng latLng) {
    _position =
        new Position(latitude: latLng.latitude, longitude: latLng.longitude);
    _markers[new MarkerId('center')] = new Marker(
        markerId: new MarkerId("center"),
        position: LatLng(latLng.latitude, latLng.longitude));
    _controller.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  @override
  Widget build(BuildContext context) {
    final header = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        //CircleAvatar(radius: 30, child: SvgPicture.asset('assets/defaults/female-avatar.svg')),
        CircleAvatar(
            radius: 30,
            child: Image.asset('assets/images/undraw_female_avatar.png')),
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
        ));

    final descriptionInput = Container(
        margin: EdgeInsets.only(bottom: 16),
        child: TextFormField(
          validator: validateEmail,
          decoration: inputStyle(hint: 'Description'),
          maxLines: 4,
        ));

    final dateHeader = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 8),
      child: TitleText('When?'),
    );

    final dateInput = Row(
      children: <Widget>[
        DateCard(date: DateTime.now(), onPressed: null, showHour: true),
        Expanded(
            child: BigButton(
          title: 'Change Date',
          color: secondaryColor,
          description: 'All day events available',
          onPressed: () {},
        ))
      ],
    );

    final saveButton = Padding(
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

    final locationHeader = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(bottom: 8),
      child: TitleText('So... here? :o'),
    );

    final mapCard = Container(
      height: cardHeight,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(_position.latitude, _position.longitude),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          if (!_mapsCompleter.isCompleted) {
            _mapsCompleter.complete(controller);
          }
        },
        markers: Set<Marker>.of(_markers.values),
      ),
    );

    final mapInput = BigButton(
      title: 'Somewhere else',
      color: secondaryColor,
      description: 'Change Location',
      onPressed: () {
        findPlace(context).then((value) => changeLocation(value));
      },
      noMargin: true,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 44),
        children: <Widget>[
          header,
          // welcomeText,
          SizedBox(height: 48.0),
          Form(
            key: form,
            child: Column(
              children: <Widget>[
                imageHeader,
                Stack(
                  children: <Widget>[
                    SelectFullImg(
                      canEdit: true,
                    ),
                    SelectCircleImg(
                      canEdit: true,
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                infoHeader,
                nameInput,
                descriptionInput,
                dateHeader,
                dateInput,
                SizedBox(height: 16.0),
                locationHeader,
                mapCard,
                SizedBox(height: 8.0),
                mapInput,
                saveButton,
              ],
            ),
          ),
          // forgotLabel
        ],
      ),
    );
  }
}
