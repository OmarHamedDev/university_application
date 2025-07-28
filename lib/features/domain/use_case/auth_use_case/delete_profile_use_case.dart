import 'package:hti_university_app_1/features/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
@injectable
class DeleteProfileUseCase {
 final AuthRepository _authRepository;
  DeleteProfileUseCase(this._authRepository);
  Future<Result<String>> invoke()async{
    return _authRepository.deletePhoto();
  }

}