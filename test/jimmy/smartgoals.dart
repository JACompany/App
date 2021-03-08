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
  final _formKey = GlobalKey<FormState>();

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
      key: _formKey,
      appBar: AppBar(
        title: Text('SMART Goals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 10.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0))),
              onChanged: (value) {
                //Do something with this value
              },
            ),
            Text(
              'When do you want your goal to be finished?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            Text(
              'Who needs to be involved to accomplish this goal?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            Text(
              'Why should you achieve this goal exactly?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            Text(
              'Do you have the needed skills?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            Text(
              'If you do not have the skills, how can you build them?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            Text(
              'What is the impact?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            Text(
              'Can the goal be achieved until this date?',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
            Text(
              'Smart Goal',
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                  hintText: 'Enter text here',
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
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );

    final _controller = TextEditingController();
    Widget form() {
      return TextField(
        controller: _controller,
      );
    }

    Widget submit_button() {
      return TextFormField(onPressed: () async {
        await checkValue(_controller.text).then((value) {
          if (value == null) {
            values.current_page = "home";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Done"),
                duration: Duration(milliseconds: 2000),
              ),
            );
            values.is_intial_setup = true;
            values.values_storage.write_all_values();
            Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                    pageBuilder: (context, animation, animation2) => Home(),
                    transitionDuration: Duration(seconds: 0)),
                (route) => false);
          }

          child:
          Text('Set', style: TextStyle(color: Colors.black, fontSize: 3.0.h));
        });
      });
    }
  }
}
