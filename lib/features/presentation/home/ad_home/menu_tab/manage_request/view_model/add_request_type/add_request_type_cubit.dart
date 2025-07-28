import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../../core/api/network/common/result.dart';
import '../../../../../../../data/model/request/request_type_request/RequestTypeRequestModel.dart';
import '../../../../../../../domain/use_case/request_type_use_case/add_request_type_use_case.dart';

part 'add_request_type_state.dart';

@injectable
class AddRequestTypeCubit extends Cubit<AddRequestTypeState> {
  final AddRequestTypeUseCase _addRequestTypeUseCase;
  AddRequestTypeCubit(this._addRequestTypeUseCase)
    : super(AddRequestTypeInitial());

  Future<void> addRequestType({
    required RequestTypeRequestModel requestTypeRequestModel,
  }) async {
    emit(AddRequestTypeLoading());
    var result = await _addRequestTypeUseCase.invoke(
      requestTypeRequestModel: requestTypeRequestModel,
    );
    switch (result) {
      case Success<String>():
        emit(AddRequestTypeSuccess());
        break;
      case Failures<String>():
        emit(AddRequestTypeError(exception: result.exception));
        break;
    }
  }
}
