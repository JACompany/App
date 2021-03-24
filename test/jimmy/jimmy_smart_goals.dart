// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = 'Smart Goals';

//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(appTitle),
//         ),
//         body: MyCustomForm(),
//       ),
//     );
//   }
// }

// // Define a custom Form widget.
// class MyCustomForm extends StatefulWidget {
//   @override
//   _MyCustomFormState createState() => _MyCustomFormState();
// }

// // Define a corresponding State class.
// // This class holds data related to the Form.
// class _MyCustomFormState extends State<MyCustomForm> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is removed from the widget tree.
//     // This also removes the _printLatestValue listener.
//     myController.dispose();
//     super.dispose();
//   }

//   final _formKey = GlobalKey<FormState>();

//   final controller1 = TextEditingController();
//   Widget form1() {
//     return TextField(
//       controller: controller1,
//     );
//   }

//   final controller2 = TextEditingController();
//   Widget form2() {
//     return TextField(
//       controller: controller2,
//     );
//   }

//   final controller3 = TextEditingController();
//   Widget form3() {
//     return TextField(
//       controller: controller3,
//     );
//   }

//   final controller4 = TextEditingController();
//   Widget form4() {
//     return TextField(
//       controller: controller4,
//     );
//   }

//   final controller5 = TextEditingController();
//   Widget form5() {
//     return TextField(
//       controller: controller5,
//     );
//   }

//   final controller6 = TextEditingController();
//   Widget form6() {
//     return TextField(
//       controller: controller6,
//     );
//   }

//   final controller7 = TextEditingController();
//   Widget form7() {
//     return TextField(
//       controller: controller7,
//     );
//   }

//   final controller8 = TextEditingController();
//   Widget form8() {
//     return TextField(
//       controller: controller8,
//     );
//   }

//   final controller9 = TextEditingController();
//   Widget form9() {
//     return TextField(
//       controller: controller9,
//     );
//   }

//   final controller10 = TextEditingController();
//   Widget form10() {
//     return TextField(
//       controller: controller10,
//     );
//   }

//   final controller11 = TextEditingController();
//   Widget form11() {
//     return TextField(
//       controller: controller11,
//     );
//   }

//   final controller12 = TextEditingController();
//   Widget from12() {
//     return TextField(
//       controller: controller12,
//     );
//   }

//   final controller13 = TextEditingController();
//   Widget form13() {
//     return TextField(
//       controller: controller13,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: ListView(
//         children: <Widget>[
//           Text(
//             'Specific',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           Text(
//             'What do you want to acheive?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller1,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'When do you want your goal to be finished?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller2,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Who needs to be involved to accomplish this goal?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller3,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Why should you achieve this goal exactly?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller4,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Measurable',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           Text(
//             'How can you measure progress and know if you have successfully met your goal?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller5,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Achievable',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           Text(
//             'Are you capable of achieving the goal?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller6,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Do you have the needed skills?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller7,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'If you do not have the skills, how can you build them?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller8,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Relevent',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           Text(
//             'Why should you achieve this goal?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller9,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'What is the impact?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller10,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Timely',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           Text(
//             'What is the due date of your goal?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller11,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Can the goal be achieved until this date?',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//           ),
//           TextField(
//             controller: controller12,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Text(
//             'Smart Goal',
//             textAlign: TextAlign.left,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           TextField(
//             controller: controller13,
//             decoration: InputDecoration(
//                 hintText: 'Enter text here',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 10.0),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.circular(5.0))),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "123456",
//                   style: TextStyle(fontSize: 4.0.h, color: Colors.black),
//                 ),
//                 SizedBox(height: 0.5.h),
//                 form1(),
//                 SizedBox(height: 0.5.h),
//                 submit_button(),
//                 SizedBox(height: 0.5.h),
//                 Text(
//                   'Submit',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 2.0.h,
//                       fontStyle: FontStyle.italic),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget submit_button() {
//     return OutlinedButton(onPressed: () async {
//       await checkValue(controller1.text)(controller2.text)(controller3.text)(
//                           controller4.text)(controller5.text)(controller6.text)(
//                       controller7.text)(controller8.text)(controller9.text)(
//                   controller10.text)(controller11.text)(controller12.text)(
//               controller13.text)
//           .then((value) {
//         if (value == null) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text("Done!"),
//             duration: Duration(milliseconds: 2000),
//           ));
//         }
//       });
//     });
//   }
// }

// submit_button() {}

// checkValue(String text) {}
