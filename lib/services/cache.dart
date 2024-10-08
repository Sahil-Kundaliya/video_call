import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static final AppCache _appCache = AppCache();

  static AppCache get instance => _appCache;

  SharedPreferences? prefs;

  setPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  setData({required String prefKey, required String data}) async {
    await prefs?.setString(prefKey, data);
  }

  Future<String?> fatchData({required String prefKey}) async {
    final String? data = prefs?.getString(prefKey);
    return data;
  }

  clearCache() {
    prefs?.clear();
  }
}

class AppCacheKeys {
  static final AppCacheKeys _appCacheKeys = AppCacheKeys();

  static AppCacheKeys instance = _appCacheKeys;

  String userName = 'userName';
  String useId = 'useId';
}
