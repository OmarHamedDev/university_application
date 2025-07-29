import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/entities/admin_student_request_entity.dart';
import '../../../../../../domain/use_case/admin_student_request_use_case/get_all_requests_type_admin_use_case.dart';

part 'request_studnet_state.dart';

@injectable
class RequestStudnetCubit extends Cubit<RequestStudnetState> {
  final GetAllRequestsTypeAdminUseCase getAllRequestsTypeAdminUseCase;
  RequestStudnetCubit(this.getAllRequestsTypeAdminUseCase)
    : super(RequestStudentInitial());

  List<AdminStudentRequestEntity> requests = [];
  Future<void> getAllRequestsTypeAdmin() async {
    emit(GetAllRequestStudentLoading());
    var result = await getAllRequestsTypeAdminUseCase.invoke();
    switch (result) {
      case Success<List<AdminStudentRequestEntity>>():
        requests = result.data ?? [];
        emit(GetAllRequestStudentSuccess());
        break;
      case Failures<List<AdminStudentRequestEntity>>():
        emit(GetAllRequestStudentError(result.exception));
        break;
    }
  }
}
