import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertodo/constants.dart';
import 'package:fluttertodo/models/TodoItem.dart';

class FireStore {
  final Firestore firestore = Firestore.instance;

  Future<void> addTodoItem(TodoItem todoItem) async {
    Map<String, dynamic> item = Map<String, dynamic>();
    item[kTitle] = todoItem.title;
    item[kDescription] = todoItem.description;
    item[kUid] = todoItem.uid;
    item[kDate] = todoItem.date.millisecondsSinceEpoch / 1000;
    var reference = await firestore.collection(kTodolist).add(item);
    assert(reference.documentID != null);
    return reference.documentID;
  }

  Future<void> deleteTodoItem(String documentId, Function callBack) async {
    try {
      await firestore.collection(kTodolist).document(documentId).delete();
      callBack('success');
    } catch (e) {
      callBack(e.toString());
    }
  }
}
