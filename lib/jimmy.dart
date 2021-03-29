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
          theme: ThemeData(
            primaryColor: values.color_peach,
          ),
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
      backgroundColor: values.color_peach,
      appBar: AppBar(
        title: Text("SMART Goals"),
      ),
      body: question_forms(),
    );
  }

  Widget question_forms() {
    return ListView(
      children: <Widget>[
        Text(
          'Specific',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'What do you want to acheive?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller1,
          decoration: formDecoration,
        ),
        Text(
          'When do you want your goal to be finished?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller2,
          decoration: formDecoration,
        ),
        Text(
          'Who needs to be involved to accomplish this goal?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller3,
          decoration: formDecoration,
        ),
        Text(
          'Why should you achieve this goal exactly?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller4,
          decoration: formDecoration,
        ),
        Text(
          'Measurable',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'How can you measure progress and know if you have successfully met your goal?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller5,
          decoration: formDecoration,
        ),
        Text(
          'Achievable',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'Are you capable of achieving the goal?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller6,
          decoration: formDecoration,
        ),
        Text(
          'Do you have the needed skills?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller7,
          decoration: formDecoration,
        ),
        Text(
          'If you do not have the skills, how can you build them?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller8,
          decoration: formDecoration,
        ),
        Text(
          'Relevent',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'Why should you achieve this goal?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller9,
          decoration: formDecoration,
        ),
        Text(
          'What is the impact?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(controller: controller10, decoration: formDecoration),
        Text(
          'Timely',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'What is the due date of your goal?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller11,
          decoration: formDecoration,
        ),
        Text(
          'Can the goal be achieved until this date?',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
        TextField(
          controller: controller12,
          decoration: formDecoration,
        ),
        Text(
          'Smart Goal',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        TextField(
          controller: controller13,
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
                                controller4.text)(controller5.text)(
                            controller6.text)(
                        controller7.text)(controller8.text)(controller9.text)(
                    controller10.text)(controller11.text)(controller12.text)(
                controller13.text)
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
        controller7.text +
        controller8.text +
        controller9.text +
        controller10.text +
        controller11.text +
        controller12.text +
        controller13.text;
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
  final controller8 = TextEditingController();
  final controller9 = TextEditingController();
  final controller10 = TextEditingController();
  final controller11 = TextEditingController();
  final controller12 = TextEditingController();
  final controller13 = TextEditingController();
}
