import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('22131'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                print("First text field: $text");
              },
            ),
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
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              'When do you want your goal to be finished?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              'Who needs to be involved to accomplish this goal?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              'Why should you achieve this goal exactly?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
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
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
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
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              'Do you have the needed skills?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              'If you do not have the skills, how can you build them?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
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
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              'What is the impact?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
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
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              'Can the goal be achieved until this date?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              'Smart Goal',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "123456",
                    style: TextStyle(fontSize: 4.0.h, color: Colors.black),
                  ),
                  SizedBox(height: 0.5.h),
                  form(),
                  SizedBox(height: 0.5.h),
                  submit_button(),
                  SizedBox(height: 0.5.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final myController = TextEditingController();
    Widget form() {
      return TextField(
        controller: _controller,
      );
    }
  }
}
