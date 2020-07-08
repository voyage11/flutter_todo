import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';

class AddTodoScreen extends StatefulWidget {
  static const String id = 'add_todo_screen';
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        backgroundColor: kMainBlueColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
      ),
    );
  }
}
