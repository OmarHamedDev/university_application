part of 'admin_news_cubit.dart';

@immutable
sealed class AdminNewsState {}

final class AdminNewsInitial extends AdminNewsState {}
class GetAllAdminNewsLoadingState extends AdminNewsState {}
class GetAllAdminNewsSuccessState extends AdminNewsState {}
class GetAllAdminNewsErrorState extends AdminNewsState {
  final Exception exception;
  GetAllAdminNewsErrorState({required this.exception});
}


class DeleteAdminNewsLoadingState extends AdminNewsState {}
class DeleteAdminNewsSuccessState extends AdminNewsState {}
class DeleteAdminNewsErrorState extends AdminNewsState {
  final Exception exception;
  DeleteAdminNewsErrorState({required this.exception});
}

