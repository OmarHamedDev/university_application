import 'package:bloc/bloc.dart';
import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/model/request/create_single_use/create_single_use_request.dart';
import '../../../../../../domain/use_case/create_use_case/create_single_use_case.dart';

part 'create_single_user_state.dart';
@injectable
class CreateSingleUserCubit extends Cubit<CreateSingleUserState> {
  final CreateSingleUseCase _createSingleUseCase;
  CreateSingleUserCubit(this._createSingleUseCase) : super(CreateSingleUserInitial());

  Future<void>createSingleUser(CreateSingleUseRequest createSingleUseRequest)async{
    emit(CreateSingleUserLoading());
    var result=await _createSingleUseCase.invoke(createSingleUseRequest);
    switch(result){
      case Success<String>():
        emit(CreateSingleUserSuccess());
      case Failures<String>():
        emit(CreateSingleUserError( result.exception));
    }
  }

}
