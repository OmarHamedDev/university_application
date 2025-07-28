import 'package:hti_university_app_1/features/domain/entities/request_type_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../../data/model/request/request_type_request/RequestTypeRequestModel.dart';
import '../../repositories/request_type_repository.dart';

@injectable
class GetAllRequestTypeUseCase {
  final RequestTypeRepository requestTypeRepository;
  GetAllRequestTypeUseCase({required this.requestTypeRepository});

  Future<Result<List<RequestTypeEntity>>> invoke() async {
    return requestTypeRepository.getAllRequestTypesAdmin();
  }
}
