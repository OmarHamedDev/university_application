import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/entities/admin_student_request_entity.dart';
import '../../../../../../domain/use_case/admin_student_request_use_case/get_all_panding_requests_admin_use_case.dart';

part 'regiect_request_state.dart';

@injectable
class RegiectRequestCubit extends Cubit<RegiectRequestState> {
  final GetAllPendingRequestsAdminUseCase _getAllPendingRequestsAdminUseCase;
  RegiectRequestCubit(this._getAllPendingRequestsAdminUseCase)
    : super(RegiectRequestInitial());

  List<AdminStudentRequestEntity> requests = [];
  Future<void> getAllPendingRequestsAdmin() async {
    emit(RegiectRequestLoading());
    var result = await _getAllPendingRequestsAdminUseCase.invoke();
    switch (result) {
      case Success<List<AdminStudentRequestEntity>>():
        requests = result.data ?? [];
        emit(RegiectRequestSuccess());
        break;
      case Failures<List<AdminStudentRequestEntity>>():
        emit(RegiectRequestError(message: result.exception));
        break;
    }
  }
}
