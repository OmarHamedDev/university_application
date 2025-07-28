import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../entities/admin_student_request_entity.dart';
import '../../entities/panding_request_enitiy.dart';
import '../../repositories/admin_student_request_repository.dart';

@injectable
class GetAllPendingRequestsAdminByIdUseCase {
  final AdminStudentRequestRepository adminStudentRequestRepository;
  GetAllPendingRequestsAdminByIdUseCase({
    required this.adminStudentRequestRepository,
  });
  Future<Result<PandingRequestEnitiy>> invoke({required int id}) async {
    return adminStudentRequestRepository.getAllPendingRequestsAdminById(id: id);
  }
}
