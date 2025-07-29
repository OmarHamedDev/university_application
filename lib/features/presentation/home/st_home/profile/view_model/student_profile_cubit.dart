import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/domain/use_case/auth_use_case/delete_profile_use_case.dart';
import 'package:hti_university_app_1/features/domain/use_case/auth_use_case/get_profile_use_case.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/menu_tab/manage_request/view_model/mangent_rquest_type/mangent_rquest_type_cubit.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/api/network/common/result.dart';
import '../../../../../domain/entities/app_user_entity.dart';
import '../../../../../domain/use_case/auth_use_case/update_profile_use_case.dart';

part 'student_profile_state.dart';

@injectable
class StudentProfileCubit extends Cubit<StudentProfileState> {
  final GetProfileUseCase _getProfileUseCase;
  final DeleteProfileUseCase _deleteProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  StudentProfileCubit(
    this._getProfileUseCase,
    this._deleteProfileUseCase,
    this._updateProfileUseCase,
  ) : super(AdminProfileInitial());

  AppUserEntity? appUserEntity;
  Future<void> getProfile() async {
    emit(GetStudentProfileLoading());
    var result = await _getProfileUseCase.invoke();
    switch (result) {
      case Success<AppUserEntity>():
        appUserEntity = result.data;
        emit(GetStudentProfileSuccess());
        break;
      case Failures<AppUserEntity>():
        emit(GetStudentProfileError(result.exception));
        break;
    }
  }

  Future<void> deleteProfile() async {
    emit(DeleteStudentProfileLoading());
    var result = await _deleteProfileUseCase.invoke();
    switch (result) {
      case Success<String>():
        emit(DeleteStudentProfileSuccess());
        break;
      case Failures<String>():
        emit(DeleteStudentProfileError(result.exception));
        break;
    }
  }

  Future<void> updateProfile({required List<MultipartFile> photo}) async {
    emit(UpdateStudentProfileLoading());
    var result = await _updateProfileUseCase.invoke(photo);
    switch (result) {
      case Success<String>():
        emit(UpdateStudentProfileSuccess());
        break;
      case Failures<String>():
        emit(UpdateStudentProfileError(result.exception));
        break;
    }
  }
}
