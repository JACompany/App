import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    ); // body is the majority of the screen.
    body:
    Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
              color: Colors.pink[800], // set border color
              width: 3.0), // set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // set rounded corner radius
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
          ] // make rounded corner of border
          ),
      child: Text("My demo styling"),
    );
  }
}
