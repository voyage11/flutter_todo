import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertodo/components/todo_list_item.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/models/TodoItem.dart';
import 'package:fluttertodo/screens/add_todo_screen.dart';
import 'package:fluttertodo/screens/profile_screen.dart';
import 'package:fluttertodo/screens/todo_details_screen.dart';

class TodoScreen extends StatefulWidget {
  static const String id = 'todo_screen';
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoItem> todoItems = List<TodoItem>();

  @override
  void dispose() {
    print('TodoScreen dispose');
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    todoItems.add(TodoItem(
        title: 'todo 1',
        description: 'Ddddd',
        date: DateTime.now(),
        uid: '1',
        id: '1'));
    todoItems.add(TodoItem(
        title: 'todo 2',
        description: '2 Ddddd',
        date: DateTime.now(),
        uid: '2',
        id: '2'));
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
      body: returnListView(),
    );
  }

  Widget returnListView() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: todoItems.length + 2,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0 || index == todoItems.length + 1) {
          return Container(); // zero height: not visible
        }
        return TodoListItem(
          index: index,
          item: todoItems[index - 1],
          onPressed: () {
            print('pressed: $index');
            Navigator.pushNamed(context, TodoDetailsScreen.id);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: 1.5,
      ),
    );
  }
}
