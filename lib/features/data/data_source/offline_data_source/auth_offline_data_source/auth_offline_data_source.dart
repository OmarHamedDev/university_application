
import '../../../../domain/entities/app_user_entity.dart';
abstract class AuthOfflineDataSource {
  Future<void> saveToken({required String? token});
  Future<void> saveRole({required String? role});
  Future<String> getRole();
  Future<void> deleteToken();
  Future<String> getToken();
  Future<void>saveAppUser({required AppUserEntity appUserEntity});
  Future<AppUserEntity> getAppUser();
}