import 'dart:ui';

import 'package:events_app/entities/event.dart';
import 'package:events_app/utils/colors.dart';
import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  EventPage() : super();

  @override
  EventState createState() => EventState();
}

class EventState extends State<EventPage> {
  EventState();

  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context).settings.arguments;

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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TitleText('English', color: clearColor),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.language,
                                        color: clearColor,
                                        size: textSize,
                                      ),
                                      ClearText(
                                        ' Language',
                                        color: clearColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  TitleText('45km', color: clearColor),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.place,
                                        color: clearColor,
                                        size: textSize,
                                      ),
                                      ClearText(
                                        ' Distance',
                                        color: clearColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TitleText('24d 6h 23m 19s', color: clearColor),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.schedule,
                                  color: clearColor,
                                  size: textSize,
                                ),
                                ClearText(
                                  ' Countdown',
                                  color: clearColor,
                                ),
                              ],
                            ),
                          ],
                        ),
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
