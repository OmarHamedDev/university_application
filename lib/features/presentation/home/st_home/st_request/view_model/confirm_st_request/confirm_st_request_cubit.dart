import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../domain/use_case/admin_student_request_use_case/create_student_request_use_case.dart';

part 'confirm_st_request_state.dart';

@injectable
class ConfirmStRequestCubit extends Cubit<ConfirmStRequestState> {
  final CreateStudentRequestUseCase createStudentRequestUseCase;
  ConfirmStRequestCubit(this.createStudentRequestUseCase)
    : super(ConfirmStRequestInitial());

  Future<void> confirmRequest({
    required List<MultipartFile> files,
    required int requestId,
    required int count,
    required String studentNameAr,
    required String studentNameEn,
    required String department,
    required int studentId,
  }) async {
    emit(ConfirmStRequestLoading());
    final result = await createStudentRequestUseCase.invoke(
      studentId: studentId,
      files: files,
      requestId: requestId,
      count: count,
      studentNameAr: studentNameAr,
      studentNameEn: studentNameEn,
      department: department,
    );
    switch (result) {
      case Success<String>():
        emit(ConfirmStRequestSuccess());
      case Failures<String>():
        emit(ConfirmStRequestError(result.exception));
    }
  }
}
