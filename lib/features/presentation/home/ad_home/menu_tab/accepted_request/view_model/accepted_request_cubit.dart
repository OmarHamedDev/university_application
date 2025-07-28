import 'package:bloc/bloc.dart';
import 'package:hti_university_app_1/features/domain/use_case/admin_student_request_use_case/get_all_accepted_requests_admin_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/entities/admin_student_request_entity.dart';

part 'accepted_request_state.dart';

@injectable
class AcceptedRequestCubit extends Cubit<AcceptedRequestState> {
  final GetAllAcceptedRequestsAdminUseCase _acceptedRequestsAdminUseCase;
  AcceptedRequestCubit(this._acceptedRequestsAdminUseCase)
    : super(AcceptedRequestInitial());

  List<AdminStudentRequestEntity> acceptedRequests = [];
  Future<void> getAllAcceptedRequestsAdmin() async {
    emit(GetAllAcceptedRequestsAdminLoading());
    final result = await _acceptedRequestsAdminUseCase.invoke();
    switch (result) {
      case Success<List<AdminStudentRequestEntity>>():
        acceptedRequests = result.data ?? [];
        emit(GetAllAcceptedRequestsAdminSuccess());
        break;
      case Failures<List<AdminStudentRequestEntity>>():
        emit(GetAllAcceptedRequestsAdminError(exception: result.exception));
        break;
    }
  }
}
