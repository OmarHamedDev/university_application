import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
@injectable
class UpdateProfileUseCase {
  final AuthRepository _authRepository;
  UpdateProfileUseCase(this._authRepository);
  Future<Result<String>> invoke(List<MultipartFile> photo) async {
    return _authRepository.updatePhoto(photo);
  }
}
