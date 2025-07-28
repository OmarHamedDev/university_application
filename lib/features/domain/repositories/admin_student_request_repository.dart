import '../../../core/api/network/common/result.dart';
import '../entities/admin_student_request_entity.dart';
import '../entities/panding_request_enitiy.dart';

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
  Future<Result<String>> rejectRequest({required int id, required String reason});
}
