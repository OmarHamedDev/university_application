import 'package:injectable/injectable.dart';
import '../../../../core/api/network/common/result.dart';
import '../../entities/app_user_entity.dart';
import '../../repositories/auth_repository.dart';
@injectable
class GetProfileUseCase{
  final AuthRepository authRepository;
  GetProfileUseCase({required this.authRepository});
  Future<Result<AppUserEntity>>invoke()async{
    return authRepository.getAppUser();
  }
}