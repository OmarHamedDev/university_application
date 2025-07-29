import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/entities/request_type_entity.dart';
import '../../../../../../domain/use_case/admin_student_request_use_case/get_all_request_type_student_use_case.dart';

part 'st_request_state.dart';

@injectable
class StRequestCubit extends Cubit<StRequestState> {
  final GetAllRequestTypeStudentUseCase getAllRequestTypeStudentUseCase;
  StRequestCubit(this.getAllRequestTypeStudentUseCase) : super(StRequestInitial());

  List<RequestTypeEntity> requestTypes = [];
  Future<void>getAllRequestType() async {
    emit(StRequestLoadingState());
    var result = await getAllRequestTypeStudentUseCase.invoke();
    switch(result){
      case Success<List<RequestTypeEntity>>():
        requestTypes = result.data ?? [];
        emit(StRequestSuccessState());
        break;
      case Failures<List<RequestTypeEntity>>():
        emit(StRequestErrorState(result.exception));
        break;
    }
  }
}
