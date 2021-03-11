import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Smart Goals';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
