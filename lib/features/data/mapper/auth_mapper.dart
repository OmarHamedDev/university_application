import 'package:injectable/injectable.dart';
import '../../domain/entities/app_user_entity.dart';
import '../data_source/offline_data_source/model/app_user_local_model/app_user_local_model.dart';
import '../model/response/app_user_response_model/app_user_response_model.dart';

abstract class AuthMapper {
  AppUserEntity mapAppUserModelToEntity(AppUserResponseModel appUserModel);
  AppUserLocalModel mapAppUserEntityToLocalModel(AppUserEntity appUserEntity);
  AppUserEntity mapAppUserLocalModelToEntity(
    AppUserLocalModel appUserLocalModel,
  );
}

@Injectable(as: AuthMapper)
class AuthMapperImpl implements AuthMapper {
  @override
  AppUserEntity mapAppUserModelToEntity(AppUserResponseModel appUserModel) {
    return AppUserEntity(
      id: appUserModel.user?.id ?? 0,
      email: appUserModel.user?.email ?? '',
      fullName: appUserModel.user?.name ?? '',
      role: appUserModel.user?.type ?? '',
      major: appUserModel.user?.major ?? '',
      phoneNumber: appUserModel.user?.phoneNumber ?? '',
      profilePhoto: appUserModel.user?.profilePhoto ?? '',
    );
  }

  @override
  AppUserLocalModel mapAppUserEntityToLocalModel(AppUserEntity appUserEntity) {
    return AppUserLocalModel(
      id: appUserEntity.id,
      email: appUserEntity.email,
      fullName: appUserEntity.fullName,
      role: appUserEntity.role,
      totalUnits: appUserEntity.totalUnits ?? 0,
      major: appUserEntity.major,
      phoneNumber: appUserEntity.phoneNumber ?? '',
      profilePhoto: appUserEntity.profilePhoto ?? '',
    );
  }

  @override
  AppUserEntity mapAppUserLocalModelToEntity(
    AppUserLocalModel appUserLocalModel,
  ) {
    return AppUserEntity(
      id: appUserLocalModel.id,
      email: appUserLocalModel.email,
      fullName: appUserLocalModel.fullName,
      role: appUserLocalModel.role,
      totalUnits: appUserLocalModel.totalUnits,
      major: appUserLocalModel.major,
      phoneNumber: appUserLocalModel.phoneNumber,
      profilePhoto: appUserLocalModel.profilePhoto,
    );
  }
}
