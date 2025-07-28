import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/data/data_source/remote_data_source/admin_request_type_remote_data_source/admin_request_type_remote_data_source_impl.dart';

import 'package:hti_university_app_1/features/data/model/request/request_type_request/RequestTypeRequestModel.dart';

import 'package:hti_university_app_1/features/domain/entities/request_type_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/network/common/execute_method.dart';
import '../../domain/repositories/request_type_repository.dart';
import '../data_source/remote_data_source/admin_request_type_remote_data_source/admin_request_type_remote_data_source.dart';

@Injectable(as: RequestTypeRepository)
class RequestTypeRepositoryImpl implements RequestTypeRepository {
  final AdminRequestTypeRemoteDataSource _adminRequestTypeRemoteDataSource;
  RequestTypeRepositoryImpl(this._adminRequestTypeRemoteDataSource);
  @override
  Future<Result<String>> addRequestType(
    RequestTypeRequestModel requestTypeRequestModel,
  ) async {
    return executeMethod<String>(
      callMethod: () {
        return _adminRequestTypeRemoteDataSource.addRequestType(
          requestTypeRequestModel,
        );
      },
    );
  }

  @override
  Future<Result<String>> deleteRequestType(int id) async {
    return executeMethod<String>(
      callMethod: () {
        return _adminRequestTypeRemoteDataSource.deleteRequestType(id);
      },
    );
  }

  @override
  Future<Result<List<RequestTypeEntity>>> getAllRequestTypesAdmin() async {
    return executeMethod<List<RequestTypeEntity>>(
      callMethod: () {
        return _adminRequestTypeRemoteDataSource.getAllRequestTypesAdmin();
      },
    );
  }

  @override
  Future<Result<String>> updateRequestType(
    int id,
    RequestTypeRequestModel requestTypeRequestModel,
  ) async {
    return executeMethod<String>(
      callMethod: () {
        return _adminRequestTypeRemoteDataSource.updateRequestType(
          id,
          requestTypeRequestModel,
        );
      },
    );
  }
}
