import 'package:dio/dio.dart';

import '../../../model/request/create_single_use/create_single_use_request.dart';

abstract class CreateRemoteDataSource {
  Future<String>createUser(CreateSingleUseRequest createSingleUseRequest);
  Future<String>uploadExcel(List<MultipartFile> files);
}