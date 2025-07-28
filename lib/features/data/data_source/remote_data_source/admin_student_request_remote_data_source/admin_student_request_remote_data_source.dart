import '../../../../domain/entities/admin_student_request_entity.dart';
import '../../../../domain/entities/panding_request_enitiy.dart';

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
}
