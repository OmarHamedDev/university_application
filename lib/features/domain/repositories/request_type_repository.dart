import 'package:hti_university_app_1/core/api/network/common/result.dart';

import '../../data/model/request/request_type_request/RequestTypeRequestModel.dart';
import '../entities/request_type_entity.dart';

abstract class RequestTypeRepository {
  Future<Result<List<RequestTypeEntity>>> getAllRequestTypesAdmin();
  Future<Result<String>> addRequestType(
    RequestTypeRequestModel requestTypeRequestModel,

  );
  Future<Result<String>> updateRequestType(
    int id,
    RequestTypeRequestModel requestTypeRequestModel,
  );
  Future<Result<String>> deleteRequestType(int id);
}
