import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/features/data/repositories_impl/graduates_repo_imp.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/menua/graduate/model/GraduatesModel.dart';
import 'package:meta/meta.dart';

import '../model/GraduateModle.dart';

part 'graduations_state.dart';

class GraduationsCubit extends Cubit<GraduationsState> {
  GraduationsCubit(this.graduatesRepoImp) : super(GraduationsInitial());
  final GraduatesRepoImp graduatesRepoImp;
  GraduatesModel? allGraduates;
  GraduateModel? graduate;
  static GraduationsCubit get(context)=>BlocProvider.of(context);
  Future<void> graduates() async {
    emit(GraduationsLoading());
    final result = await graduatesRepoImp.graduates();
    allGraduates=GraduatesModel.fromJson(result.data);
    if (kDebugMode) {
      print(allGraduates);
    }
    emit(GraduationsSuc());
  }
  Future<void> graduatesById({required String id}) async {
    emit(GraduationLoading());
    final result = await graduatesRepoImp.graduateById(id: id);
    graduate=GraduateModel.fromJson(result.data);
    if (kDebugMode) {
      print(graduate?.data);
    }
    emit(GraduationSuc());
  }
}
