import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/components/main_button.dart';
import 'package:fluttertodo/models/TodoItem.dart';
import 'package:intl/intl.dart';
import 'package:fluttertodo/mixins/app_message.dart';
import 'package:fluttertodo/services/firestore.dart';

class TodoDetailsScreen extends StatefulWidget {
  static const String id = 'todo_details_screen';
  @override
  _TodoDetailsScreenState createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> with AppMessage {
  @override
  Widget build(BuildContext context) {
    final TodoItem item = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Details'),
        backgroundColor: kMainBlueColor,
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
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  DateFormat('dd MMM yyyy hh:mm a (E)').format(item.date),
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  item.description,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                MainButton(
                  title: 'Mark as Complete',
                  type: ButtonType.complete,
                  onPressed: () async {
                    String documentId = item.id;
                    await FireStore().deleteTodoItem(documentId, (message) {
                      if (message == 'success') {
                        AppMessage.show(
                            context: context,
                            title: 'Success',
                            description: 'The TODO item is completed.',
                            type: MessageType.success);
                        Navigator.pop(context);
                      } else {
                        AppMessage.show(
                            context: context,
                            title: 'Error',
                            description: message,
                            type: MessageType.error);
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
