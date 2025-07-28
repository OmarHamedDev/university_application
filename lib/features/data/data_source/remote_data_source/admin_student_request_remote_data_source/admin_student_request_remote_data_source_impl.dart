import 'package:injectable/injectable.dart';

import '../../../../domain/entities/admin_student_request_entity.dart';
import '../../../../domain/entities/panding_request_enitiy.dart';
import '../../../api/api_manger.dart';
import '../../../mapper/admin_studetn_request_mapper.dart';
import 'admin_student_request_remote_data_source.dart';

@Injectable(as: AdminStudentRequestRemoteDataSource)
class AdminStudentRequestRemoteDataSourceImpl
    implements AdminStudentRequestRemoteDataSource {
  final ApiManger apiManger;
  final AdminStudentRequestMapper adminStudentRequestMapper;
  AdminStudentRequestRemoteDataSourceImpl(
    this.apiManger,
    this.adminStudentRequestMapper,
  );
  @override
  Future<List<AdminStudentRequestEntity>> getAllAcceptedRequestsAdmin() async {
    var adminStudentRequestResponseModel =
        await apiManger.getAllAcceptedRequestsAdmin();
    return adminStudentRequestMapper
        .mapAdminStudentRequestResponseModelToEntity(
          adminStudentRequestResponseModel,
        );
  }

  @override
  Future<List<AdminStudentRequestEntity>> getAllPendingRequestsAdmin() async {
    var adminStudentRequestResponseModel =
        await apiManger.getAllPendingRequestsAdmin();
    return adminStudentRequestMapper
        .mapAdminStudentRequestResponseModelToEntity(
          adminStudentRequestResponseModel,
        );
  }

  @override
  Future<List<AdminStudentRequestEntity>> getAllRejectedRequestsAdmin() async {
    var adminStudentRequestResponseModel =
        await apiManger.getAllRejectedRequestsAdmin();
    return adminStudentRequestMapper
        .mapAdminStudentRequestResponseModelToEntity(
          adminStudentRequestResponseModel,
        );
  }

  @override
  Future<String> acceptRequest({
    required int id,
    required String delivery_date,
  }) async {
    await apiManger.acceptRequest(id, {"delivery_date": delivery_date});
    return "Success";
  }

  @override
  Future<PandingRequestEnitiy> getAllPendingRequestsAdminById({
    required int id,
  }) async {
    var adminStudentRequestResponseModel = await apiManger
        .getAllPendingRequestsAdminById(id);
    return adminStudentRequestMapper.mapPandingRequestResponseModelToEntity(
      adminStudentRequestResponseModel,
    );
  }

  @override
  Future<String> rejectRequest({
    required int id,
    required String reason,
  }) async {
    await apiManger.rejectRequest(id, {"reason": reason});
    return "Success";
  }
}
