import 'package:injectable/injectable.dart';

import '../../../../domain/entities/request_type_entity.dart';
import '../../../api/api_manger.dart';
import '../../../mapper/request_type_mapper.dart';
import '../../../model/request/request_type_request/RequestTypeRequestModel.dart';
import 'admin_request_type_remote_data_source.dart';

@Injectable(as: AdminRequestTypeRemoteDataSource)
class AdminRequestTypeRemoteDataSourceImpl
    implements AdminRequestTypeRemoteDataSource {
  final ApiManger apiManger;
  final RequestTypeMapper requestTypeMapper;
  AdminRequestTypeRemoteDataSourceImpl(this.apiManger, this.requestTypeMapper);
  @override
  Future<String> addRequestType(
    RequestTypeRequestModel requestTypeRequestModel,
  ) async {
    await apiManger.addRequestType(requestTypeRequestModel);
    return "success";
  }

  @override
  Future<String> deleteRequestType(int id) async {
    await apiManger.deleteRequestType(id);
    return "success";
  }

  @override
  Future<List<RequestTypeEntity>> getAllRequestTypesAdmin() async {
    var result = await apiManger.getAllRequestsTypeAdmin();
    return requestTypeMapper.mapRequestTypeResponseModelToEntity(result);
  }

  @override
  Future<String> updateRequestType(
    int id,
    RequestTypeRequestModel requestTypeRequestModel,
  ) async {
    await apiManger.updateRequestType(id, requestTypeRequestModel);
    return "success";
  }
}
