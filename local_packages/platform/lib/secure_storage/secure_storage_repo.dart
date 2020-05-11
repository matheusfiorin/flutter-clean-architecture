import 'dart:convert';

import 'package:data/repositories/storage/secure_storage_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepoImpl extends SecureStorageRepo {
  FlutterSecureStorage _storage;

  SecureStorageRepoImpl() {
    _storage = FlutterSecureStorage();
  }

  @override
  Future<void> write({String key, String value}) =>
      _storage.write(key: key, value: value);

  @override
  Future<void> writeAsJson(
      {@required String key, @required Map<String, dynamic> value}) {
    final jsonString = json.encode(value);
    return _storage.write(key: key, value: jsonString);
  }

  @override
  Future<String> read({String key}) => _storage.read(key: key);

  @override
  Future<Map<String, dynamic>> readFromJson({@required String key}) async {
    final jsonString = await _storage.read(key: key);
    if (jsonString == null) return null;
    return json.decode(jsonString);
  }

  @override
  Future<Map<String, String>> readAll() => _storage.readAll();

  @override
  Future<void> delete({String key}) => _storage.delete(key: key);

  @override
  Future<void> deleteAll() => _storage.deleteAll();
}
