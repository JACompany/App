import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'globalValues.dart' as values;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Questions(),
        );
      });
    });
  }
}

class Questions extends StatefulWidget {
  @override
  _Questions createState() => _Questions();
}

class _Questions extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Check"),
      ),
      body: question_forms(),
    );
  }

  Widget question_forms() {
    return ListView(
      children: <Widget>[
        Text(
          'How many tasks were you able to complete this week?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller1,
          decoration: formDecoration,
        ),
        Text(
          'How many productive hours did you achieve this week?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller2,
          decoration: formDecoration,
        ),
        Text(
          'What task(s) are you most proud of that you completed this week?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller3,
          decoration: formDecoration,
        ),
        Text(
          'Do you notice a change in your work productivity?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller4,
          decoration: formDecoration,
        ),
        Text(
          'Were you able to achieve your set goal for total productive hours?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller5,
          decoration: formDecoration,
        ),
        Text(
          'What could have been done differently to meet your set goal or further improve your goal?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller6,
          decoration: formDecoration,
        ),
        Text(
          'How many productive hours do you wish to achieve for the upcoming week?',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller7,
          decoration: formDecoration,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.5.h),
              submit_button(),
              SizedBox(height: 0.5.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget submit_button() {
    return OutlinedButton(
      onPressed: () async {
        await checkValue(controller1.text)(controller2.text)(controller3.text)(
                    controller4.text)(controller5.text)(controller6.text)(
                controller7.text)
            .then((value) {
          if (value == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Done!"),
              duration: Duration(milliseconds: 2000),
            ));
          }
        });
      },
      child: Text(
        'Submit',
        style: TextStyle(
            color: Colors.black, fontSize: 2.0.h, fontStyle: FontStyle.italic),
      ),
    );
  }

  checkValue(String text) {
    String userInput = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text +
        controller5.text +
        controller6.text +
        controller7.text;
  }

  final formDecoration = InputDecoration(
    hintText: 'Enter text here',
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 10.0),
        borderRadius: BorderRadius.circular(5.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(5.0)),
  );
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();
  final controller7 = TextEditingController();
}
