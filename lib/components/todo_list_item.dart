import 'package:flutter/material.dart';
import 'package:fluttertodo/models/TodoItem.dart';
import 'package:intl/intl.dart';

class TodoListItem extends StatelessWidget {
  final TodoItem item;
  final int index;
  final Function onPressed;
  TodoListItem({this.index, this.item, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
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
                    height: 4,
                  ),
                  Text(
                    DateFormat('dd MMM yyyy hh:mm a (E)').format(item.date),
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 15),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 35,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
