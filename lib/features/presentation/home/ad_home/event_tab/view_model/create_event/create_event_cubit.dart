import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/domain/use_case/event_use_case/create_event_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';

part 'create_event_state.dart';

@injectable
class CreateEventCubit extends Cubit<CreateEventState> {
  final CreateEventUseCase _createEventUseCase;
  CreateEventCubit(this._createEventUseCase) : super(CreateEventInitial());
  Future<void> createEvent({
    required List<MultipartFile> files,
    required String title,
    required String description,
    required String startTime,
  }) async {
    emit(CreateEventLoadingState());
    final result = await _createEventUseCase.invoke(
      files: files,
      title: title,
      description: description,
      startTime: startTime,
    );
    switch (result) {
      case Success<String>():
        emit(CreateEventSuccessState());
        break;
      case Failures<String>():
        emit(CreateEventErrorState(result.exception));
        break;
    }
  }
}
