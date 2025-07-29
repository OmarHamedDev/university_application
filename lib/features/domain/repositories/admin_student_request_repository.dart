import 'package:dio/dio.dart';

import '../../../core/api/network/common/result.dart';
import '../entities/admin_student_request_entity.dart';
import '../entities/panding_request_enitiy.dart';
import '../entities/request_type_entity.dart';

abstract class AdminStudentRequestRepository {
  Future<Result<List<AdminStudentRequestEntity>>> getAllPendingRequestsAdmin();
  Future<Result<List<AdminStudentRequestEntity>>> getAllAcceptedRequestsAdmin();
  Future<Result<List<AdminStudentRequestEntity>>> getAllRejectedRequestsAdmin();
  Future<Result<PandingRequestEnitiy>> getAllPendingRequestsAdminById({
    required int id,
  });
  Future<Result<String>> acceptRequest({
    required int id,
    required String delivery_date,
  });
  Future<Result<String>> rejectRequest({
    required int id,
    required String reason,
  });

  Future<Result<List<AdminStudentRequestEntity>>> getAllRequestsTypeAdmin();
  Future<Result<String>> addRequestTypeStudent({
    required List<MultipartFile> files,
    required int requestId,
    required int count,
    required String studentNameAr,
    required String studentNameEn,
    required String department,
    required int studentId,
  });


  Future<Result<List<RequestTypeEntity>>> getAllRequestsTypeStudent();
}
