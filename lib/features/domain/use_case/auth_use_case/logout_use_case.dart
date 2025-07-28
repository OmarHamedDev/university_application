import 'package:injectable/injectable.dart';
import '../../../../core/api/network/common/result.dart';
import '../../repositories/auth_repository.dart';
@injectable
class LogoutUseCase{
  final AuthRepository authRepository;
  LogoutUseCase({required this.authRepository});
  Future<Result<String>>invoke()async{
    return authRepository.logout();
  }
}