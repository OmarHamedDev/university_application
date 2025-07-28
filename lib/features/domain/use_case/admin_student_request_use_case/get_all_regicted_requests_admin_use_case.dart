import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:injectable/injectable.dart';

import '../../entities/admin_student_request_entity.dart';
import '../../repositories/admin_student_request_repository.dart';
@injectable
class GetAllRejectedRequestsAdminUseCase {
  final AdminStudentRequestRepository adminStudentRequestRepository;
  GetAllRejectedRequestsAdminUseCase({
    required this.adminStudentRequestRepository,
  });

  Future<Result<List<AdminStudentRequestEntity>>> invoke() async {
    return adminStudentRequestRepository.getAllRejectedRequestsAdmin();
  }
}
