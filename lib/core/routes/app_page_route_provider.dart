import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hti_university_app_1/features/home/std_home_screen.dart';
import 'package:hti_university_app_1/features/on_boarding/on_boarding_screen.dart';
import 'package:injectable/injectable.dart';
import '../../core/caching/secure_storge/secure_storage.dart';
import '../../features/data/data_source/offline_data_source/model/app_user_local_model/app_user_local_model.dart';
import '../../features/domain/entities/app_user_entity.dart';
import '../../features/home/admin_home_screen.dart';
import '../caching/secure_storge/cache_keys.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  final SecureStorageFunction _secureStorage = SecureStorageFunction();
  Role _role = Role.guest;
  Role get role => _role;
  AppUserEntity? appUserEntity;
  String? _token;
  String? get token => _token;

  Future<void> initializeAppConfig() async {
    print("initializeAppConfig");
    await _initializeToken();
    print("token: $_token");
    await _initializeRole();
    print("role: $_role");
    await _getAppUserEntity();
    notifyListeners();
  }

  Future<void> _initializeRole() async {
    String? roleValue = await _secureStorage.readData(key: CacheKeys.role);
    _setRole(roleValue);
    print("roleValue: $roleValue");
  }

  Future<void> _getAppUserEntity() async {
    var appUserBox = await _initializeAppUserBox();
    var appUserLocalModel = appUserBox.get(CacheKeys.user);
    appUserEntity = AppUserEntity(
      id: appUserLocalModel?.id ?? 0,
      email: appUserLocalModel?.email ?? "",
      major: appUserLocalModel?.major ?? "",
      role: appUserLocalModel?.role ?? "",
      fullName: appUserLocalModel?.fullName ?? "",
      totalUnits: appUserLocalModel?.totalUnits ?? 0,
      phoneNumber: appUserLocalModel?.phoneNumber ?? "",
      profilePhoto: appUserLocalModel?.profilePhoto ?? "",
    );
  }

  Future<Box<AppUserLocalModel>> _initializeAppUserBox() async {
    if (!Hive.isBoxOpen(CacheKeys.user)) {
      return await Hive.openBox<AppUserLocalModel>(CacheKeys.user);
    } else {
      return Hive.box<AppUserLocalModel>(CacheKeys.user);
    }
  }

  void _setRole(String? roleValue) {
    if (roleValue == "graduate") {
      _role = Role.student;
    } else if (roleValue == "admin") {
      _role = Role.admin;
    } else {
      _role = Role.guest;
    }
  }

  Future<void> _initializeToken() async {
    _token = await _secureStorage.readData(key: CacheKeys.token);
    print("token: $_token");
  }

  String getInitialPageRouteName() {
    if(token==null || token!.isEmpty || appUserEntity==null) return OnBoardingScreen.routeName;
    if (role == Role.student) return StdHomeScreen.routeName;
    if (role == Role.admin) return AdminHomeScreen.routeName;
    return OnBoardingScreen.routeName;
  }

  Future<void> logout() async {
    await _secureStorage.deleteData(key: CacheKeys.token);
    _token = null;
    notifyListeners();
  }
}

enum Role { student, admin, guest }
