import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../repositories/admin_student_request_repository.dart';

@injectable
class AcceptRequestUseCase {
  final AdminStudentRequestRepository adminStudentRequestRepository;
  AcceptRequestUseCase({required this.adminStudentRequestRepository});
  Future<Result<String>> invoke({
    required int id,
    required String delivery_date,
  }) async {
    return adminStudentRequestRepository.acceptRequest(
      id: id,
      delivery_date: delivery_date,
    );
  }
}
