import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/use_case/admin_student_request_use_case/regicted_request_use_case.dart';

part 'reject_reason_state.dart';

@injectable
class RejectReasonCubit extends Cubit<RejectReasonState> {
  final RegictedRequestUseCase _regictedRequestUseCase;
  RejectReasonCubit(this._regictedRequestUseCase)
    : super(RejectReasonInitial());
  Future<void> rejectRequest({required int id, required String reason}) async {
    emit(RejectReasonLoading());
    var result = await _regictedRequestUseCase.invoke(id: id, reason: reason);
    switch (result) {
      case Success<String>():
        emit(RejectReasonSuccess());
        break;
      case Failures<String>():
        emit(RejectReasonError(message: result.exception));
    }
  }
}
