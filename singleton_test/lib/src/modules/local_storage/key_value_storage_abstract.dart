enum LocalStorageServiceType { sharedPreferences, hive }

abstract class IKeyValueStorage {
  LocalStorageServiceType get type;
  Future<void> init();
  Future<void> write(String key, dynamic value);
  dynamic read(String key);
  Future<void> delete(String key);
  Future<void> clear();
}
