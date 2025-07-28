import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/entities/admin_student_request_entity.dart';
import '../../../../../../domain/entities/panding_request_enitiy.dart';
import '../../../../../../domain/use_case/admin_student_request_use_case/accept_request_use_case.dart';
import '../../../../../../domain/use_case/admin_student_request_use_case/get_all_pending_requests_admin_by_Id_use_case.dart';
import '../../../../../../domain/use_case/admin_student_request_use_case/regicted_request_use_case.dart';

part 'confirm_request_state.dart';

@injectable
class ConfirmRequestCubit extends Cubit<ConfirmRequestState> {
  final GetAllPendingRequestsAdminByIdUseCase
  _getAllPendingRequestsAdminByIdUseCase;
  final RegictedRequestUseCase _regictedRequestUseCase;
  final AcceptRequestUseCase _acceptRequestUseCase;
  ConfirmRequestCubit(
    this._getAllPendingRequestsAdminByIdUseCase,
    this._regictedRequestUseCase,
    this._acceptRequestUseCase,
  ) : super(ConfirmRequestInitial());

  PandingRequestEnitiy requests = PandingRequestEnitiy();
  Future<void> getAllPendingRequestsAdmin(int id) async {
    emit(GetAllConfirmRequestLoadingState());
    var result = await _getAllPendingRequestsAdminByIdUseCase.invoke(id: id);
    switch (result) {
      case Success<PandingRequestEnitiy>():
        requests = result.data;
        emit(GetAllConfirmRequestSuccessState());
        break;
      case Failures<PandingRequestEnitiy>():
        emit(GetAllConfirmRequestErrorState(exception: result.exception));
        break;
    }
  }

  Future<void> acceptRequest({
    required int id,
    required String delivery_date,
  }) async {
    emit(AcceptRequestLoadingState());
    var result = await _acceptRequestUseCase.invoke(
      id: id,
      delivery_date: delivery_date,
    );
    switch (result) {
      case Success<String>():
        emit(AcceptRequestSuccessState());
        break;
      case Failures<String>():
        emit(AcceptRequestErrorState(exception: result.exception));
        break;
    }
  }

  Future<void> rejectRequest({required int id, required String reason}) async {
    emit(RejectRequestLoadingState());
    var result = await _regictedRequestUseCase.invoke(id: id, reason: reason);
    switch (result) {
      case Success<String>():
        emit(RejectRequestSuccessState());
        break;
      case Failures<String>():
        emit(RejectRequestErrorState(exception: result.exception));
    }
  }
}
