import 'dart:ui';

import 'package:events_app/components/selectImg.dart';
import 'package:events_app/entities/event.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';

import '../repository.dart';

class EventPage extends StatefulWidget {
  EventPage() : super();

  @override
  EventState createState() => EventState();
}

class EventState extends State<EventPage> {
  var repo = new Repository();
  Event _event = new Event();

  EventState() {
    repo.events.listen((value) {
      setState(() {
        _event = value[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
        Container(
          height: selectImgFullHeight,
          color: backgroundColor,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32)),
            child: SelectFullImg(),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.all(8),
            child: FloatingActionButton(
              onPressed: () {},
              child: Image.asset('assets/images/undraw_female_avatar.png'),
              shape: borderRadius,
              mini: true,
            ),
          ),
        )
      ],
    );

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
                  child: Column(
                    children: <Widget>[
                      TitleText(
                        _event.name != null
                            ? _event.name +
                                'lorem ipsum dolor sit amet lorem ipsum dolor sit'
                            : '',
                        color: secondaryColor,
                        align: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 32.0),
                        child: ClearText(
                            'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet ',
                            color: secondaryColor),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('data'),
                                Text('data'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.amber,
                              child: Column(
                                children: <Widget>[
                                  Text('data'),
                                  Text('data'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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
