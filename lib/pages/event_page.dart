import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:events_app/entities/event.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:events_app/utils/maps.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventPage extends StatefulWidget {
  EventPage() : super();

  @override
  EventState createState() => EventState();
}

class EventState extends State<EventPage> {
  GoogleMapController _controller;
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  Completer<GoogleMapController> _mapsCompleter = Completer();
  Position _position = Position(latitude: 0, longitude: 0);
  EventState();

  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context).settings.arguments;

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
          final newPosition = new Position(
              latitude: event.latitude, longitude: event.longitude);
          _position = newPosition;
          _controller.animateCamera(CameraUpdate.newLatLng(
              new LatLng(newPosition.latitude, newPosition.longitude)));
          _markers[new MarkerId('center')] = new Marker(
              markerId: new MarkerId("center"),
              position: LatLng(newPosition.latitude, newPosition.longitude));
          if (!_mapsCompleter.isCompleted) {
            _mapsCompleter.complete(controller);
          }
        },
        markers: Set<Marker>.of(_markers.values),
      ),
    );

    final infoCard = (Widget value, IconData icon, String label) {
      return Column(
        children: <Widget>[
          value,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: clearColor,
                size: textSize,
              ),
              ClearText(
                ' ' + label,
                color: clearColor,
              ),
            ],
          ),
        ],
      );
    };

    final infoList = (List<Widget> widgets) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widgets));
    };

    getDateString() {
      final days = event.date.difference(new DateTime.now()).inDays;
      final hours = event.date.difference(new DateTime.now()).inHours;
      return days.toString() + 'd ' + (hours % 24).toString() + 'h';
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: <Widget>[
          //The background
          Positioned(
            left: 0,
            right: 0,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: selectImgFullHeight + 16),
              child: Container(
                color: clearColor,
                child: Image.asset('assets/images/undraw_page.png'),
              ),
            ),
          ),
          //The scroll view
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  height: selectImgFullHeight,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16)),
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TitleText(
                          event.name,
                          color: clearColor,
                          align: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 32.0),
                          child: ClearText(
                              'lorem ipsum dolor sit amet lorem ipsum dolor sim dolor sit amet lorem ipsdolor sit amet lorem ipsumipsum dolor sit amet ',
                              color: clearColor),
                        ),
                        infoList([
                          infoCard(MainText(event.language, color: clearColor),
                              Icons.language, 'Language'),
                          infoCard(
                              FutureBuilder(
                                  future: getDistanceString(event),
                                  initialData: '',
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    return MainText(snapshot.data,
                                        color: clearColor);
                                  }),
                              Icons.place,
                              'Distance'),
                        ]),
                        infoList([
                          infoCard(MainText(getDateString(), color: clearColor),
                              Icons.schedule, 'Countdown'),
                        ]),
                        mapCard
                      ],
                    ),
                  ),
                ),
              ]))
            ],
          )
        ],
      ),
    );
  }
}
