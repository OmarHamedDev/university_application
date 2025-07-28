import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../../data/model/request/request_type_request/RequestTypeRequestModel.dart';
import '../../repositories/request_type_repository.dart';

@injectable
class DeleteRequestTypeUseCase {
  final RequestTypeRepository requestTypeRepository;
  DeleteRequestTypeUseCase({required this.requestTypeRepository});

  Future<Result<String>>invoke({ required int id})async{
    return requestTypeRepository.deleteRequestType(id);
  }
}