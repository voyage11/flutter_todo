import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> login(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final FirebaseUser user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    print('login: $user');
    return user;
  }

  Future<FirebaseUser> signUp(email, password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final FirebaseUser user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    print('signUp: $user');
    return user;
  }
}
