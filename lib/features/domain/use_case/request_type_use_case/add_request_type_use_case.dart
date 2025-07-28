import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../../data/model/request/request_type_request/RequestTypeRequestModel.dart';
import '../../repositories/request_type_repository.dart';

@injectable
class AddRequestTypeUseCase {
  final RequestTypeRepository requestTypeRepository;
  AddRequestTypeUseCase({required this.requestTypeRepository});

  Future<Result<String>>invoke({ required RequestTypeRequestModel requestTypeRequestModel})async{
    return requestTypeRepository.addRequestType(requestTypeRequestModel);
  }
}