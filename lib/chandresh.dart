import 'package:flutter/material.dart';
import 'globalValues.dart';
import 'homepage.dart';

void main() {
  runApp(SliderWidget());
}

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() {
    return _SliderWidgetState();
  }
}

class _SliderWidgetState extends State<SliderWidget> {
  double value = 5.0;
  double value1 = 5.0;
  double value2 = 5.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Slider',
        home: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
              child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 100, 10, 1),
                child: Text(
                  'How did you feel BEFORE your task on a scale from 1-10?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Slider.adaptive(
                    min: 0,
                    max: 10,
                    value: value,
                    activeColor: color_red,
                    inactiveColor: color_peach,
                    divisions: 10,
                    label: "$value",
                    onChanged: (changedValue) {
                      setState(() {
                        value = changedValue;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 100, 10, 1),
                child: Text(
                  'How did you feel DURING your task on a scale from 1-10?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Slider.adaptive(
                    min: 0,
                    max: 10,
                    value: value1,
                    activeColor: color_red,
                    inactiveColor: color_peach,
                    divisions: 10,
                    label: "$value1",
                    onChanged: (changedValue) {
                      setState(() {
                        value1 = changedValue;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 100, 10, 1),
                child: Text(
                  'How did you feel AFTER your task on a scale from 1-10?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Slider.adaptive(
                    min: 0,
                    max: 10,
                    value: value2,
                    activeColor: color_red,
                    inactiveColor: color_peach,
                    divisions: 10,
                    label: "$value2",
                    onChanged: (changedValue) {
                      setState(() {
                        value2 = changedValue;
                      });
                    },
                  ),
                ),
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          pageBuilder: (context, animation, animation2) =>
                              Home(),
                          transitionDuration: Duration(seconds: 0)),
                      (route) => false);
                },
                icon: Icon(Icons.west_outlined),
                label: Text('Skip'),
                color: Colors.grey[500],
                splashColor: color_peach,
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          pageBuilder: (context, animation, animation2) =>
                              Home(),
                          transitionDuration: Duration(seconds: 0)),
                      (route) => false);
                },
                icon: Icon(Icons.east_outlined),
                label: Text('Submit'),
                color: color_red,
                splashColor: color_peach,
              ),
            ],
          )),
        ));
  }
}
