import 'package:shared_preferences/shared_preferences.dart';

import '../api/models/user.dart';

enum PrefKeys { loggedIn, id, fullName, email, token, isActive }

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save(User user) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    // await _sharedPreferences.setString(PrefKeys.fullName.name, user.fullName);
    // await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    await _sharedPreferences.setString(
        PrefKeys.token.name, "Bearer ${user.token}");
  }

  T? getValue<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }

  Future<void> setValue<T>(String key, dynamic value) async {
    if (T == String) {
      await _sharedPreferences.setString(key, value as String);
    } else if (T == bool) {
      await _sharedPreferences.setBool(key, value as bool);
    } else if (T == int) {
      await _sharedPreferences.setInt(key, value as int);
    } else if (T == double) {
      await _sharedPreferences.setDouble(key, value as double);
    }
  }

  Future<bool> removeValueFor(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }
}
