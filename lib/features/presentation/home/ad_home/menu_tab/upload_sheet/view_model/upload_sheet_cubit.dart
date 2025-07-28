import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/domain/use_case/create_use_case/upload_excal_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';

part 'upload_sheet_state.dart';

@injectable
class UploadSheetCubit extends Cubit<UploadSheetState> {
  final UploadExcalUseCase uploadExcalUseCase;
  UploadSheetCubit(this.uploadExcalUseCase) : super(UploadSheetInitial());

  Future<void>uploadSheet({required List<MultipartFile> upload})async{
    emit(UploadSheetLoading());
    final result = await uploadExcalUseCase.execute(upload);
    switch(result){
      case Success<String>():
        emit(UploadSheetSuccess());
        break;
      case Failures<String>():
        emit(UploadSheetError(result.exception));
        break;
    }
  }
}
