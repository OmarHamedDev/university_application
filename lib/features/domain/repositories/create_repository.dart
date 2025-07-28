import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/data/model/request/create_single_use/create_single_use_request.dart';

import '../../../core/api/network/common/result.dart';

abstract class CreateRepository {
  Future<Result<String>>createSingleUser(CreateSingleUseRequest createSingleUseRequest);
  Future<Result<String>>uploadExcel(List<MultipartFile> files);
}