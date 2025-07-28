import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/domain/entities/admin_student_request_entity.dart';
import 'package:hti_university_app_1/features/domain/entities/panding_request_enitiy.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/network/common/execute_method.dart';
import '../../domain/repositories/admin_student_request_repository.dart';
import '../data_source/remote_data_source/admin_student_request_remote_data_source/admin_student_request_remote_data_source.dart';

@Injectable(as: AdminStudentRequestRepository)
class AdminStudentRequestRepositoryImpl
    implements AdminStudentRequestRepository {
  final AdminStudentRequestRemoteDataSource adminStudentRequestRemoteDataSource;
  AdminStudentRequestRepositoryImpl({
    required this.adminStudentRequestRemoteDataSource,
  });

  @override
  Future<Result<List<AdminStudentRequestEntity>>>
  getAllAcceptedRequestsAdmin() async {
    return await executeMethod<List<AdminStudentRequestEntity>>(
      callMethod: () async {
        return await adminStudentRequestRemoteDataSource
            .getAllAcceptedRequestsAdmin();
      },
    );
  }

  @override
  Future<Result<List<AdminStudentRequestEntity>>>
  getAllPendingRequestsAdmin() async {
    return await executeMethod<List<AdminStudentRequestEntity>>(
      callMethod: () async {
        return await adminStudentRequestRemoteDataSource
            .getAllPendingRequestsAdmin();
      },
    );
  }

  @override
  Future<Result<List<AdminStudentRequestEntity>>>
  getAllRejectedRequestsAdmin() async {
    return executeMethod<List<AdminStudentRequestEntity>>(
      callMethod: () async {
        return await adminStudentRequestRemoteDataSource
            .getAllRejectedRequestsAdmin();
      },
    );
  }

  @override
  Future<Result<String>> acceptRequest({
    required int id,
    required String delivery_date,
  }) async {
    return executeMethod<String>(
      callMethod: () async {
        return await adminStudentRequestRemoteDataSource.acceptRequest(
          id: id,
          delivery_date: delivery_date,
        );
      },
    );
  }

  @override
  Future<Result<PandingRequestEnitiy>>
  getAllPendingRequestsAdminById({required int id}) async {
    return executeMethod<PandingRequestEnitiy>(
      callMethod: () async {
        return await adminStudentRequestRemoteDataSource
            .getAllPendingRequestsAdminById(id: id);
      },
    );
  }

  @override
  Future<Result<String>> rejectRequest({
    required int id,
    required String reason,
  }) async {
    return executeMethod<String>(
      callMethod: () async {
        return await adminStudentRequestRemoteDataSource.rejectRequest(
          id: id,
          reason: reason,
        );
      },
    );
  }
}
