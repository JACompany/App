import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'globalValues.dart' as values;
import 'package:sizer/sizer.dart';
import 'homepage.dart';
import 'leaderboard.dart';
import 'progress_page.dart';

void main() => runApp(LineChartSample1());

class LineChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  get data => values.past_hours;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizerUtil().init(constraints, orientation);
          return MaterialApp(
            home: Profile(),
          );
        });
      },
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  bool get maintainState {
    return false;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: values.color_green,
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 4.0.h,
            ),
          ),
          leading: IconButton(
            onPressed: null,
            icon: Icon(Icons.account_circle),
            disabledColor: Colors.black,
            iconSize: 3.0.h,
          )),
      body: update_user_details(),
      bottomNavigationBar: Container(
        height: 8.0.h,
        alignment: Alignment.bottomCenter,
        color: values.color_green,
        child: Row(
          children: [
            Expanded(
                child: IconButton(
              icon: Icon(
                Icons.timer,
                color:
                    values.current_page == "home" ? Colors.white : Colors.black,
              ),
              onPressed: onPressed1,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.insights),
              onPressed: onPressed2,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.leaderboard),
              onPressed: onPressed3,
              iconSize: 6.0.h,
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: onPressed4,
              iconSize: 6.0.h,
            ))
          ],
        ),
      ),
    );
  }

  Widget update_user_details() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: false,
            decoration: InputDecoration(
                hintText: 'Display Name',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 32.0),
                    borderRadius: BorderRadius.circular(5.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0))),
            onChanged: (value) {
              //Do something with this value
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Prcessing data..."),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                }
              },
              child: Text('Update'),
            ),
          ),
        ],
      ),
    );
  }

  void onPressed1() {
    values.current_page = "home";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Home(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed2() {
    values.current_page = "progress";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => ProgressPage(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed3() {
    values.current_page = "leaderboard";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Leaderboard(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }

  void onPressed4() {
    values.current_page = "profile";
    Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, animation2) => Profile(),
            transitionDuration: Duration(seconds: 0)),
        (route) => false);
  }
}
