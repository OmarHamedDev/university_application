import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../api/api_manger.dart';
import '../../../model/request/create_single_use/create_single_use_request.dart';
import 'create_remote_data_source.dart';

@Injectable(as: CreateRemoteDataSource)
class CreateRemoteDataSourceImpl implements CreateRemoteDataSource {
  final ApiManger _apiManger;
  CreateRemoteDataSourceImpl(this._apiManger);
  @override
  Future<String> createUser(
    CreateSingleUseRequest createSingleUseRequest,
  ) async {
    var response = await _apiManger.createStudentUser(createSingleUseRequest);
    return response;
  }

  @override
  Future<String> uploadExcel(List<MultipartFile> files) async {
    var response = await _apiManger.uploadExcel(files);
    return response;
  }
}
