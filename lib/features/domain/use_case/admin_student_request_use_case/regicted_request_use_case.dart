import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../repositories/admin_student_request_repository.dart';

@injectable
class RegictedRequestUseCase {
  final AdminStudentRequestRepository adminStudentRequestRepository;
  RegictedRequestUseCase({required this.adminStudentRequestRepository});
  Future<Result<String>> invoke({
    required int id,
    required String reason,
  }) async {
    return adminStudentRequestRepository.rejectRequest(id: id, reason: reason);
  }
}
