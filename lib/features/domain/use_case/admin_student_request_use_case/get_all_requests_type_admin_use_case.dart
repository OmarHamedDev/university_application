import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../entities/admin_student_request_entity.dart';
import '../../repositories/admin_student_request_repository.dart';

@injectable
class GetAllRequestsTypeAdminUseCase {
  final AdminStudentRequestRepository _adminStudentRequestRepository;
  GetAllRequestsTypeAdminUseCase(this._adminStudentRequestRepository);
  Future<Result<List<AdminStudentRequestEntity>>> invoke() async {
    return _adminStudentRequestRepository.getAllRequestsTypeAdmin();
  }
}