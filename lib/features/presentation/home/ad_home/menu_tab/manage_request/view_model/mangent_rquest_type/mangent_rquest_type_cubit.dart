import 'package:bloc/bloc.dart';
import 'package:hti_university_app_1/features/domain/use_case/request_type_use_case/get_all_request_type_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../../core/api/network/common/result.dart';
import '../../../../../../../domain/entities/request_type_entity.dart';
import '../../../../../../../domain/use_case/request_type_use_case/delete_request_type_use_case.dart';

part 'mangent_rquest_type_state.dart';

@Injectable()
class MangentRquestTypeCubit extends Cubit<MangentRquestTypeState> {
  final GetAllRequestTypeUseCase _getAllRequestTypeUseCase;
  final DeleteRequestTypeUseCase _deleteRequestTypeUseCase;
  MangentRquestTypeCubit(
    this._getAllRequestTypeUseCase,
    this._deleteRequestTypeUseCase,
  ) : super(MangentRquestTypeInitial());

  List<RequestTypeEntity> requestTypeList = [];
  Future<void> getAllRequestType() async {
    emit(GetAllRequestTypeLoading());
    var result = await _getAllRequestTypeUseCase.invoke();
    switch (result) {
      case Success<List<RequestTypeEntity>>():
        requestTypeList = result.data ?? [];
        emit(GetAllRequestTypeSuccess());
        break;
      case Failures<List<RequestTypeEntity>>():
        emit(GetAllRequestTypeError(exception: result.exception));
        break;
    }
  }

  Future<void> deleteRequestType({required int id}) async {
    emit(DeleteRequestTypeLoading());
    var result = await _deleteRequestTypeUseCase.invoke(id: id);
    switch (result) {
      case Success<String>():
        deleteNewsById(id: id);
        emit(DeleteRequestTypeSuccess());
        break;
      case Failures<String>():
        emit(DeleteRequestTypeError(exception: result.exception));
        break;
    }
  }

  void deleteNewsById({required int id}) async {
    requestTypeList.removeWhere((element) => element.id == id);
  }
}
