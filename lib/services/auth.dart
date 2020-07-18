import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertodo/services/cache.dart';

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
    Cache().setCache(CacheType.uid, user.uid);
    Cache().setCache(CacheType.email, user.email);
    Cache().setCache(CacheType.displayName, user.displayName);
    return user;
  }

  Future<FirebaseUser> signUp(String email, String password) async {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final FirebaseUser user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    Cache().setCache(CacheType.uid, user.uid);
    Cache().setCache(CacheType.email, user.email);
    Cache().setCache(CacheType.displayName, user.displayName);
    return user;
  }

  Future<FirebaseUser> saveFirstName(String displayName) async {
    FirebaseUser user = await _auth.currentUser();
    assert(user != null);
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    assert(userUpdateInfo != null);
    userUpdateInfo.displayName = displayName;
    await user.updateProfile(userUpdateInfo);
    Cache().setCache(CacheType.displayName, displayName);
    return user;
  }
}
