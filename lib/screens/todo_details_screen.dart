import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';

class TodoDetailsScreen extends StatefulWidget {
  static const String id = 'todo_details_screen';
  @override
  _TodoDetailsScreenState createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Details'),
        backgroundColor: kMainBlueColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
      ),
    );
  }
}
