import 'package:flutter/foundation.dart';
import 'package:fluttertodo/models/user.dart';

class UserData extends ChangeNotifier {
  User currentUser = User();

  void setEmailUid(String email, String uid) {
    currentUser.setEmailUid(email, uid);
    print('setEmailUid: $currentUser');
    notifyListeners();
  }

  void setName(String name) {
    currentUser.setName(name);
    notifyListeners();
  }
}
