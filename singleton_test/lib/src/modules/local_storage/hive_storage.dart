import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:singleton_test/src/constants/build_env.dart';

import 'key_value_storage_abstract.dart';

@Singleton(as: IKeyValueStorage, env: [BuildEnv.hiveEnv])
class HiveStorage implements IKeyValueStorage {
  late Box _box;

  @override
  Future<void> init() async {
    Hive.initFlutter();
    _box = await Hive.openBox('myBox');
  }

  @override
  Future<void> write(String key, dynamic value) async {
    await _box.put(key, value);
  }

  @override
  dynamic read(String key) {
    return _box.get(key);
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  LocalStorageServiceType get type => LocalStorageServiceType.hive;
}
