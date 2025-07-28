import 'package:bloc/bloc.dart';
import 'package:hti_university_app_1/features/domain/entities/event_entity.dart';
import 'package:hti_university_app_1/features/domain/use_case/event_use_case/get_all_event_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/use_case/event_use_case/delete_event_use_case.dart';

part 'admin_event_state.dart';

@injectable
class AdminEventCubit extends Cubit<AdminEventState> {
  final GetAllEventUseCase _getAllEventUseCase;
  final DeleteEventUseCase _deleteEventUseCase;
  AdminEventCubit(this._getAllEventUseCase, this._deleteEventUseCase)
    : super(AdminEventInitial());
  List<EventEntity> _eventsList = [];
  List<EventEntity> get eventsList => _eventsList;
  Future<void> getAllEvents() async {
    emit(GetAllAdminEventLoadingState());
    var result = await _getAllEventUseCase.invoke();
    switch (result) {
      case Success<List<EventEntity>>():
        _eventsList = result.data ?? [];
        emit(GetAllAdminEventSuccessState());
        break;
      case Failures<List<EventEntity>>():
        emit(GetAllAdminEventErrorState(exception: result.exception));
        break;
    }
  }

  Future<void> deleteEvent({required int id}) async {
    emit(DeleteAdminEventLoadingState());
    var result = await _deleteEventUseCase.invoke(id: id);
    switch (result) {
      case Success<String>():
        deleteNewsById(id: id);
        emit(DeleteAdminEventSuccessState());
        break;
      case Failures<String>():
        emit(DeleteAdminEventErrorState(exception: result.exception));
        break;
    }
  }

  void deleteNewsById({required int id}) async {
    _eventsList.removeWhere((element) => element.id == id);
  }

  String formatISOTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime).toLocal();
    final formatter = DateFormat('hh:mm a dd/MM/yyyy'); // النتيجة: 12:00 AM 23/07/2025
    return formatter.format(dateTime);
  }
}
