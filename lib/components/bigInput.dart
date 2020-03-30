import 'package:events_app/utils/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BigInput extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final bool noMargin;
  final String inputText;
  final Function(String) inputSubmit;

  BigInput({@required this.title, @required this.description, @required this.color, this.noMargin = false, @required this.inputText, @required this.inputSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(noMargin ? 0 : 10, 0, 0, 0),
      color: color,
      height: bigButton,
      width: double.infinity,
      child: Slidable(
        closeOnScroll: false,
        actionPane: SlidableBehindActionPane(),
        actionExtentRatio: 1,
        child: InputOpen(title: title, color: color, description: description),
        secondaryActions: <Widget>[
          SlideAction(
            closeOnTap: false,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 10, 10  , 10),
              child: Action(inputText: inputText, submit: inputSubmit,)
            ),
            // child: Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.fromLTRB(10, 10, 10  , 10),
            //   child: TextFormField(
            //     keyboardType: TextInputType.emailAddress,
            //     autofocus: false,
            //     decoration: inputStyle(hint: 'Email'),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

class Action extends StatefulWidget {
  final Function(String) submit;
  final String inputText;

  Action({this.submit, this.inputText}) : super();

  ActionState createState() => ActionState();  
}

class ActionState extends State<Action> {
  TextEditingController inputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 4,
          child: TextFormField(
            controller: inputController,
            autofocus: false,
            decoration: inputStyle(hint: widget.inputText),
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () async{
            var p = await PlacesAutocomplete.show(
              context: context,
              apiKey: "AIzaSyAGydxMpbwrdPyNoLd8ubt29ul-gGBEOBQ",
              mode: Mode.overlay, // Mode.fullscreen
              // language: "pt",
              // components: [new Component(Component.country, "fr")]
            );
            print(p);
            // widget.submit(inputController.text);
            // Slidable.of(context).close();
          }),
        ),
        // TextFormField(
        //   keyboardType: TextInputType.emailAddress,
        //   autofocus: false,
        //   decoration: inputStyle(hint: 'Email'),
        // ),
      ],
    );
  }
  
}

class InputOpen extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  
  InputOpen({this.color, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      // padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: FlatButton(
        onPressed: () {
          Slidable.of(context).open();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MainText(title, color: Colors.white),
                ClearText(description, color: Colors.white),
              ]
            ),
            IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.white), onPressed: () {}),
          ],
        ),
      ),
    );
  }
  
}