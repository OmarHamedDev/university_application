import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../entities/request_type_entity.dart';
import '../../repositories/admin_student_request_repository.dart';
import '../../repositories/request_type_repository.dart';

@injectable
class GetAllRequestTypeStudentUseCase {
  final AdminStudentRequestRepository adminStudentRequestRepository;
  GetAllRequestTypeStudentUseCase({required this.adminStudentRequestRepository});


  Future<Result<List<RequestTypeEntity>>> invoke() async {
    return adminStudentRequestRepository.getAllRequestsTypeStudent();
  }
}