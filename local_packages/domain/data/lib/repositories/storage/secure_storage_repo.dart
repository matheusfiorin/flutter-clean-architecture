abstract class SecureStorageRepo {
  Future<void> write({String key, String value});

  Future<void> writeAsJson({String key, Map<String, dynamic> value});

  Future<String> read({String key});

  Future<Map<String, dynamic>> readFromJson({String key});

  Future<Map<String, String>> readAll();

  Future<void> delete({String key});

  Future<void> deleteAll();
}
