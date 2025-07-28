import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/entities/admin_student_request_entity.dart';
import '../../../../../../domain/use_case/admin_student_request_use_case/get_all_regicted_requests_admin_use_case.dart';

part 'regiected_request_state.dart';

@injectable
class RegiectedRequestCubit extends Cubit<RegiectedRequestState> {
  final GetAllRejectedRequestsAdminUseCase getAllRejectedRequestsAdminUseCase;

  RegiectedRequestCubit(this.getAllRejectedRequestsAdminUseCase) : super(RegiectedRequestInitial());


  List<AdminStudentRequestEntity> adminStudentRequected = [];
  Future<void> getAllRegictedRequestsAdmin() async {
    emit(GetAllRejectedRequestsAdminLoading());
    var result = await getAllRejectedRequestsAdminUseCase.invoke();
    switch (result) {
      case Success<List<AdminStudentRequestEntity>>():
        adminStudentRequected = result.data ?? [];
        emit(GetAllRejectedRequestsAdminSuccess());
        break;
      case Failures<List<AdminStudentRequestEntity>>():
        emit(GetAllRejectedRequestsAdminError(exception: result.exception));
        break;
    }
  }

}
