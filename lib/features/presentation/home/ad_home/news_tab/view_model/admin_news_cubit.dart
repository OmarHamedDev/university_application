import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hti_university_app_1/features/domain/use_case/news_use_case/get_all_news_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/api/network/common/result.dart';
import '../../../../../domain/entities/news_entity.dart';
import '../../../../../domain/use_case/news_use_case/create_news_use_case.dart';
import '../../../../../domain/use_case/news_use_case/delete_news_use_case.dart';

part 'admin_news_state.dart';

@injectable
class AdminNewsCubit extends Cubit<AdminNewsState> {
  final GetAllNewsUseCase _allNewsUseCase;
  final DeleteNewsUseCase _deleteNewsUseCase;
  final CreateNewsUseCase _createNewsUseCase;
  AdminNewsCubit(
    this._allNewsUseCase,
    this._deleteNewsUseCase,
    this._createNewsUseCase,
  ) : super(AdminNewsInitial());

  List<NewsEntity> _newsList = [];
  List<NewsEntity> get newsList => _newsList;
  Future<void> getAllNews() async {
    emit(GetAllAdminNewsLoadingState());
    var result = await _allNewsUseCase.invoke();
    switch (result) {
      case Success<List<NewsEntity>>():
        _newsList = result.data ?? [];
        emit(GetAllAdminNewsSuccessState());
        break;
      case Failures<List<NewsEntity>>():
        emit(GetAllAdminNewsErrorState(exception: result.exception));
        break;
    }
  }

  Future<void> deleteNews({required int id}) async {
    emit(DeleteAdminNewsLoadingState());
    var result = await _deleteNewsUseCase.invoke(id: id);
    switch (result) {
      case Success<String>():
        deleteNewsById(id: id);
        emit(DeleteAdminNewsSuccessState());
        break;
      case Failures<String>():
        emit(DeleteAdminNewsErrorState(exception: result.exception));
        break;
    }
  }

  void deleteNewsById({required int id}) async {
    newsList.removeWhere((element) => element.id == id);
  }

  String formatISOTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime).toLocal();
    final formatter = DateFormat('hh:mm a dd/MM/yyyy'); // النتيجة: 12:00 AM 23/07/2025
    return formatter.format(dateTime);
  }
}
