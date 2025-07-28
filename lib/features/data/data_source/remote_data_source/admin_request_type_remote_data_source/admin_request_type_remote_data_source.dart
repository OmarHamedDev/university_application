import '../../../../domain/entities/request_type_entity.dart';
import '../../../model/request/request_type_request/RequestTypeRequestModel.dart';

abstract class AdminRequestTypeRemoteDataSource {
  Future<List<RequestTypeEntity>> getAllRequestTypesAdmin();
  Future<String> addRequestType(
    RequestTypeRequestModel requestTypeRequestModel,
  );
  Future<String> updateRequestType(
    int id,
    RequestTypeRequestModel requestTypeRequestModel,
  );
  Future<String> deleteRequestType(int id);
}
