import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/models/TodoItem.dart';

class FireStore {
  final Firestore firestore = Firestore.instance;

  Future<String> addTodoItem(TodoItem todoItem) async {
    Map<String, dynamic> item = Map<String, dynamic>();
    item[kTitle] = todoItem.title;
    item[kDescription] = todoItem.description;
    item[kUid] = todoItem.uid;
    item[kDate] = todoItem.date.millisecondsSinceEpoch / 1000;
    print('item: $item');
    var reference = await firestore.collection(kTodolist).add(item);
    return reference.documentID;
  }
}
