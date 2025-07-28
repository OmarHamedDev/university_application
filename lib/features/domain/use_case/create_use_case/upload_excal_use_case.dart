import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/domain/repositories/create_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../../data/model/request/create_single_use/create_single_use_request.dart';

@injectable
class UploadExcalUseCase {
  final CreateRepository _createRepository;
  UploadExcalUseCase(this._createRepository);
  Future<Result<String>> execute(List<MultipartFile> upload) {
    return _createRepository.uploadExcel(upload);
  }
}
