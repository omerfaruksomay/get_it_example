import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:singleton_test/src/constants/build_env.dart';

import 'key_value_storage_abstract.dart';

@Singleton(as: IKeyValueStorage, env: [BuildEnv.sharedPrefsEnv])
class SharedPreferencesStorage implements IKeyValueStorage {
  late SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> write(String key, dynamic value) async {
    if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw Exception('Invalid value type');
    }
  }

  @override
  dynamic read(String key) {
    return _prefs.get(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }

  @override
  LocalStorageServiceType get type => LocalStorageServiceType.sharedPreferences;

  @override
  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }
}
