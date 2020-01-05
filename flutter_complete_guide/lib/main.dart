import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstContentApp());
}

// Simple app widget with a text label set
class MyVeryFirstApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: Text('My very first app'));
  }
}

/* 
  Simple app widget using an AppBar and a Scaffold for creating a 
  nice styling for the text in the content area
*/
class MyFirstContentApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is my first navigation bar'),
        ),
        body: Text('This is my first content text'),
      ),
    );
  }
}
