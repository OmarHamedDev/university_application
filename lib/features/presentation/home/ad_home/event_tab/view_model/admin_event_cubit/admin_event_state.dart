part of 'admin_event_cubit.dart';

@immutable
sealed class AdminEventState {}

final class AdminEventInitial extends AdminEventState {}
class GetAllAdminEventLoadingState extends AdminEventState {}
class GetAllAdminEventSuccessState extends AdminEventState {}
class GetAllAdminEventErrorState extends AdminEventState {
  final Exception exception;
  GetAllAdminEventErrorState({required this.exception});
}


class DeleteAdminEventLoadingState extends AdminEventState {}
class DeleteAdminEventSuccessState extends AdminEventState {}
class DeleteAdminEventErrorState extends AdminEventState {
  final Exception exception;
  DeleteAdminEventErrorState({required this.exception});
}
