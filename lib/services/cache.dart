import 'package:shared_preferences/shared_preferences.dart';

enum CacheType { uid, email, displayName }

class Cache {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getCache(CacheType type) async {
    final SharedPreferences prefs = await _prefs;
    switch (type) {
      case CacheType.uid:
        return prefs.getString(CacheType.uid.toString()) ?? '';
        break;
      case CacheType.email:
        return prefs.getString(CacheType.email.toString()) ?? '';
        break;
      default:
        return prefs.getString(CacheType.displayName.toString()) ?? '';
        break;
    }
  }

  Future<void> setCache(CacheType type, String text) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(type.toString(), text).then((bool success) =>
        {print('save success ${type.toString()}: ${getCache(type)}')});
  }
}
