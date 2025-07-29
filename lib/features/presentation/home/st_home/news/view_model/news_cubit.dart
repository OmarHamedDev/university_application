import 'package:bloc/bloc.dart';
import 'package:hti_university_app_1/features/domain/use_case/news_use_case/get_all_news_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/api/network/common/result.dart';
import '../../../../../domain/entities/news_entity.dart';

part 'news_state.dart';
@injectable
class NewsCubit extends Cubit<NewsState> {
  final GetAllNewsUseCase _allNewsUseCase;
  NewsCubit(this._allNewsUseCase) : super(NewsInitial());

  List<NewsEntity> _news = [];
  List<NewsEntity> get news => _news;
  Future<void> getAllNews() async {
    emit(GetAllNewsLoadingState());
    var result = await _allNewsUseCase.invoke();
    switch (result) {
      case Success<List<NewsEntity>>():
        _news = result.data ?? [];
        emit(GetAllNewsSuccessState());
      case Failures<List<NewsEntity>>():
        emit(GetAllNewsErrorState( result.exception));
        break;
    }
  }
  String formatISOTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime).toLocal();
    final formatter = DateFormat('hh:mm a dd/MM/yyyy'); // النتيجة: 12:00 AM 23/07/2025
    return formatter.format(dateTime);
  }
}
