import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../../data/model/request/request_type_request/RequestTypeRequestModel.dart';
import '../../repositories/request_type_repository.dart';

@injectable
class UpdateRequestTypeUseCase {
  final RequestTypeRepository requestTypeRepository;
  UpdateRequestTypeUseCase({required this.requestTypeRepository});

  Future<Result<String>>invoke({ required int id,required RequestTypeRequestModel requestTypeRequestModel})async{
    return requestTypeRepository.updateRequestType( id ,requestTypeRequestModel);
  }
}