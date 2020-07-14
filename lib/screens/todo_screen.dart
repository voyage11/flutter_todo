import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/screens/add_todo_screen.dart';
import 'package:fluttertodo/screens/profile_screen.dart';
import 'package:fluttertodo/services/cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertodo/components/todo_list.dart';

class TodoScreen extends StatefulWidget {
  static const String id = 'todo_screen';
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final Firestore firestore = Firestore.instance;
  String uid = '';

  @override
  void dispose() {
    print('TodoScreen dispose');
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    var uid = await Cache().getCache(CacheType.uid);
    //print('future uid: $uid');
    setState(() {
      this.uid = uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text('TODO'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.id);
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddTodoScreen.id);
            },
          )
        ],
      ),
      body: TodoList(
        firestore: this.firestore,
        uid: this.uid,
      ),
    );
  }
}
