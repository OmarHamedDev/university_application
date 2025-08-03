import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/features/data/repositories_impl/notification_repo_imp.dart';
import 'package:hti_university_app_1/features/home/std_home_tabs/notification/model/NotificationModel.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepoImp) : super(NotificationInitial());
  static NotificationCubit get(context)=>BlocProvider.of(context);
  final NotificationRepoImp notificationRepoImp;
  NotificationModel? notificationModel;
  notification() async {
    emit(NotificationLoading());
    final response=await notificationRepoImp.notification();
    notificationModel=NotificationModel.fromJson(response.data);
    emit(NotificationSuc());
  }

  String formatISOTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime).toLocal();
    final formatter = DateFormat('hh:mm a dd/MM/yyyy'); // النتيجة: 12:00 AM 23/07/2025
    return formatter.format(dateTime);
  }
}
