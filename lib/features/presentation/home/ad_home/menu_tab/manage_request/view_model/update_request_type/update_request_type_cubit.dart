import 'package:bloc/bloc.dart';
import 'package:hti_university_app_1/features/domain/use_case/request_type_use_case/update_request_type_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../../core/api/network/common/result.dart';
import '../../../../../../../data/model/request/request_type_request/RequestTypeRequestModel.dart';

part 'update_request_type_state.dart';
@injectable
class UpdateRequestTypeCubit extends Cubit<UpdateRequestTypeState> {
  final UpdateRequestTypeUseCase _updateRequestTypeUseCase;
  UpdateRequestTypeCubit(this._updateRequestTypeUseCase) : super(UpdateRequestTypeInitial());


  Future<void>updateRequestType({required int id,required RequestTypeRequestModel requestTypeRequestModel})async{
    emit(UpdateRequestTypeLoading());
    var result=await _updateRequestTypeUseCase.invoke(id: id, requestTypeRequestModel: requestTypeRequestModel);
    switch(result){
      case Success<String>():
        emit(UpdateRequestTypeSuccess());
        break;
      case Failures<String>():
        emit(UpdateRequestTypeError(exception: result.exception));
        break;
    }
  }

}
