import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/mixins/app_message.dart';
import 'package:fluttertodo/models/TodoItem.dart';
import 'package:fluttertodo/services/firestore.dart';
import 'package:fluttertodo/services/cache.dart';

class AddTodoScreen extends StatefulWidget {
  static const String id = 'add_todo_screen';
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> with AppMessage {
  String title = '';
  String description = '';
  String uid = '';

  void getUid() async {
    uid = await Cache().getCache(CacheType.uid);
  }

  @override
  Widget build(BuildContext context) {
    getUid();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a TODO Item'),
        backgroundColor: kMainBlueColor,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: () async {
              print('title: $title description: $description uid: $uid');
              TodoItem newItem = TodoItem(
                title: title,
                description: description,
                uid: uid,
                date: DateTime.now(),
              );
              await FireStore().addTodoItem(newItem).then((documentId) {
                AppMessage.show(
                    context: context,
                    title: 'Success',
                    description: 'The TODO item is added.',
                    type: MessageType.success);
                Navigator.pop(context);
              }).catchError((e) => AppMessage.show(
                  context: context,
                  title: 'Error',
                  description: e.toString(),
                  type: MessageType.error));
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Text(
                  'TODO Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: (text) {
                    setState(() {
                      title = text;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'TODO Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (text) {
                    setState(() {
                      description = text;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
