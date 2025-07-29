import 'package:dio/dio.dart';

import '../../../../domain/entities/admin_student_request_entity.dart';
import '../../../../domain/entities/panding_request_enitiy.dart';
import '../../../../domain/entities/request_type_entity.dart';

abstract class AdminStudentRequestRemoteDataSource {
  Future<List<AdminStudentRequestEntity>> getAllPendingRequestsAdmin();
  Future<List<AdminStudentRequestEntity>> getAllAcceptedRequestsAdmin();
  Future<List<AdminStudentRequestEntity>> getAllRejectedRequestsAdmin();
  Future<PandingRequestEnitiy> getAllPendingRequestsAdminById({required int id});
  Future<String> acceptRequest({
    required int id,
    required String delivery_date,
  });
  Future<String> rejectRequest({required int id, required String reason});

  Future<List<AdminStudentRequestEntity>> getAllRequestsTypeAdmin();
  Future<String> addRequestTypeStudent({
   required List<MultipartFile> files,
    required int requestId,
    required int count,
    required String studentNameAr,
    required String studentNameEn,
    required String department,
    required int studentId,
  });

  Future<List<RequestTypeEntity>> getAllRequestsTypeStudent();

}
