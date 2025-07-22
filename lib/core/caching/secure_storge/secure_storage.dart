import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'caching_Data.dart';

@Injectable(as: CachingDataSecureStorage)
class SecureStorageFunction implements CachingDataSecureStorage {
  FlutterSecureStorage? _secureStorageInstance;
  Future<FlutterSecureStorage> _getInstance() async {
    return _secureStorageInstance ?? const FlutterSecureStorage();
  }

  @override
  Future<void> deleteData({required String key}) async {
    final storage = await _getInstance();
    await storage.delete(key: key);
  }

  @override
  Future<String?> readData({required String key}) async {
    final storage = await _getInstance();
    return await storage.read(key: key);
  }

  @override
  Future<void> writeData({required String key, required String value}) async {
    final storage = await _getInstance();
    await storage.write(key: key, value: value);
  }
}
