import 'package:injectable/injectable.dart';

import '../../../../../core/caching/secure_storge/cache_keys.dart';
import '../../../../../core/caching/secure_storge/caching_Data.dart';
import '../../../mapper/auth_mapper.dart';
import '../model/app_user_local_model/app_user_local_model.dart';
import 'auth_offline_data_source.dart';
import 'package:hti_university_app_1/features/domain/entities/app_user_entity.dart';
import 'package:hive/hive.dart';
@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  final CachingDataSecureStorage _cachingDataSecureStorage;
  final AuthMapper _authMapper;
  AuthOfflineDataSourceImpl(this._cachingDataSecureStorage, this._authMapper);
  @override
  Future<void> saveToken({required String? token}) async {
    if (token != null) {
      await _cachingDataSecureStorage.writeData(
          key: CacheKeys.token, value: token);
    } else {
      throw Exception("Token Is Empty");
    }
  }

  @override
  Future<void> deleteToken() async {
    await _cachingDataSecureStorage.deleteData(key: CacheKeys.token);
  }

  @override
  Future<String> getToken() async {
    try {
      String? token =
          await _cachingDataSecureStorage.readData(key: CacheKeys.token);
      if (token != null) {
        return token;
      } else {
        throw Exception("Token Is Empty");
      }
    } catch (e) {
      throw Exception("Token Is Empty");
    }
  }

  @override
  Future<String> getRole() async {
    {
      try {
        String? role =
            await _cachingDataSecureStorage.readData(key: CacheKeys.role);
        if (role != null) {
          return role;
        } else {
          throw Exception("Role Is Empty");
        }
      } catch (e) {
        throw Exception("Role Is Empty");
      }
    }
  }

  @override
  Future<void> saveRole({required String? role}) async {
    if (role != null) {
      await _cachingDataSecureStorage.writeData(
          key: CacheKeys.role, value: role);
    } else {
      throw Exception("Role Is Empty");
    }
  }

  @override
  Future<AppUserEntity> getAppUser() async {
    try {
      final box = await _getAppUserBox();
      AppUserLocalModel? appUserLocalModel = box.get(CacheKeys.user);
      if (appUserLocalModel != null) {
        return _authMapper.mapAppUserLocalModelToEntity(appUserLocalModel);
      } else {
        throw Exception("App User Is Empty");
      }
    } catch (e) {
      throw Exception("App User Is Empty");
    }
  }

  @override
  Future<void> saveAppUser({required AppUserEntity appUserEntity}) async {
    try {
      final box = await _getAppUserBox();
      var appUserLocalModel = _authMapper.mapAppUserEntityToLocalModel(appUserEntity);
      await box.put(CacheKeys.user, appUserLocalModel);
    } catch (e) {
      throw Exception("Error while saving app user");
    }
  }

  Future<Box<AppUserLocalModel>> _getAppUserBox() async {
    if (!Hive.isBoxOpen(CacheKeys.user)) {
      return await Hive.openBox<AppUserLocalModel>(CacheKeys.user);
    }
    return Hive.box<AppUserLocalModel>(CacheKeys.user);
  }
}
