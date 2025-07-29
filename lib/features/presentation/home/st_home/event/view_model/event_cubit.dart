import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/api/network/common/result.dart';
import '../../../../../domain/entities/event_entity.dart';
import '../../../../../domain/use_case/event_use_case/get_all_event_use_case.dart';

part 'event_state.dart';

@injectable
class EventCubit extends Cubit<EventState> {
  final GetAllEventUseCase getAllEventUseCase;
  EventCubit(this.getAllEventUseCase) : super(EventInitial());

  List<EventEntity> _events = [];
  List<EventEntity> get events => _events;
  Future<void> getAllEvents() async {
    emit(StEventsLoadingState());
    var result = await getAllEventUseCase.invoke();
    switch (result) {
      case Success<List<EventEntity>>():
        _events = result.data ?? [];
        emit(StEventsLoadedState());
      case Failures<List<EventEntity>>():
        emit(StEventsErrorState(exception: result.exception));
        break;
    }
  }
  String formatISOTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime).toLocal();
    final formatter = DateFormat('hh:mm a dd/MM/yyyy'); // النتيجة: 12:00 AM 23/07/2025
    return formatter.format(dateTime);
  }
}
