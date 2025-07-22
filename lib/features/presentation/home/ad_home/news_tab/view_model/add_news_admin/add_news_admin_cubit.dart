import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/use_case/news_use_case/create_news_use_case.dart';

part 'add_news_admin_state.dart';

@injectable
class AddNewsAdminCubit extends Cubit<AddNewsAdminState> {
  final CreateNewsUseCase _createNewsUseCase;
  AddNewsAdminCubit(this._createNewsUseCase) : super(AddNewsAdminInitial());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Future<void> createNews() async {
    if (formKey.currentState!.validate()) {
      emit(CreateAdminNewsLoadingState());
      var result = await _createNewsUseCase.invoke(
        title: titleController.text,
        content: contentController.text,
      );
      switch (result) {
        case Success<String>():
          emit(CreateAdminNewsSuccessState());
          break;
        case Failures<String>():
          emit(CreateAdminNewsErrorState(exception: result.exception));
          break;
      }
    }
  }
}
