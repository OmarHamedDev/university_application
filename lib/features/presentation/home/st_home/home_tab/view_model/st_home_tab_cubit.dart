import 'package:bloc/bloc.dart';
import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/domain/use_case/event_use_case/get_all_event_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/entities/event_entity.dart';
import '../../../../../domain/entities/news_entity.dart';
import '../../../../../domain/use_case/news_use_case/get_all_news_use_case.dart';
import 'package:intl/intl.dart';

part 'st_home_tab_state.dart';

@injectable
class StHomeTabCubit extends Cubit<StHomeTabState> {
  final GetAllEventUseCase _getAllEventUseCase;
  final GetAllNewsUseCase _getAllNewsUseCase;
  StHomeTabCubit(this._getAllEventUseCase, this._getAllNewsUseCase)
    : super(StHomeTabInitial());

  List<EventEntity> _events = [];
  List<EventEntity> get events => _events;
  Future<void> getAllEvents() async {
    emit(StHomeTabEventsLoadedState());
    var result = await _getAllEventUseCase.invoke();
    switch (result) {
      case Success<List<EventEntity>>():
        _events = result.data ?? [];
        emit(StHomeTabEventsLoadedState());
      case Failures<List<EventEntity>>():
        emit(StHomeTabEventsErrorState(
          exception:  result.exception,
        ));
        break;
    }
  }

  List<NewsEntity> _news = [];
  List<NewsEntity> get news => _news;
  Future<void> getAllNews() async {
    emit(StHomeTabNewsLoading());
    var result = await _getAllNewsUseCase.invoke();
    switch (result) {
      case Success<List<NewsEntity>>():
        _news = result.data ?? [];
        emit(StHomeTabNewsLoadedState());
      case Failures<List<NewsEntity>>():
        emit(StHomeTabNewsErrorState(exception: result.exception));
        break;
    }
  }

  String formatISOTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime).toLocal();
    final formatter = DateFormat('hh:mm a dd/MM/yyyy'); // النتيجة: 12:00 AM 23/07/2025
    return formatter.format(dateTime);
  }

}
