import 'package:flutter/material.dart';
import 'package:fluttertodo/constants.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:fluttertodo/components/todo_list_item.dart';
import 'package:fluttertodo/models/TodoItem.dart';
import 'package:fluttertodo/screens/todo_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoList extends StatelessWidget {
  TodoList({this.firestore, this.uid});
  final Firestore firestore;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestore
          .collection(kTodolist)
          .where(kUid, isEqualTo: uid)
          .orderBy(kDate)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: Loading(
              indicator: BallSpinFadeLoaderIndicator(),
              size: 100.0,
              color: Colors.blueGrey,
            ),
          );
        final int itemsCount = snapshot.data.documents.length;
        return ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: itemsCount + 2,
          itemBuilder: (_, int index) {
            if (index == 0 || index == itemsCount + 1) {
              return Container(); // zero height: not visible
            }
            final DocumentSnapshot document =
                snapshot.data.documents[index - 1];
            String title = '';
            String uid = '';
            String id = document.documentID;
            String description = '';
            DateTime date = DateTime.now();
            //print('id: $id');
            if (document.data.containsKey(kTitle)) {
              title = document.data[kTitle];
            }
            if (document.data.containsKey(kUid)) {
              uid = document.data[kUid];
            }
            if (document.data.containsKey(kDescription)) {
              description = document.data[kDescription];
            }
            if (document.data.containsKey(kDate)) {
              double timeDouble = document.data[kDate];
              int timeInt = timeDouble.round() * 1000;
              date = DateTime.fromMillisecondsSinceEpoch(timeInt, isUtc: false);
            }
            TodoItem item = TodoItem(
                title: title,
                description: description,
                date: date,
                uid: uid,
                id: id);
            return TodoListItem(
              index: index,
              item: item,
              onPressed: () {
                print('pressed: $index');
                Navigator.pushNamed(context, TodoDetailsScreen.id,
                    arguments: item);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1.5,
          ),
        );
      },
    );
  }
}
