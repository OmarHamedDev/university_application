part of 'admin_profile_cubit.dart';

@immutable
sealed class AdminProfileState {}

final class AdminProfileInitial extends AdminProfileState {}
class GetAdminProfileLoading extends AdminProfileState {}
class GetAdminProfileSuccess extends AdminProfileState {}
class GetAdminProfileError extends AdminProfileState {
  final Exception exception;
  GetAdminProfileError(this.exception);
}


class DeleteAdminProfileLoading extends AdminProfileState {}
class DeleteAdminProfileSuccess extends AdminProfileState {}
class DeleteAdminProfileError extends AdminProfileState {
  final Exception exception;
  DeleteAdminProfileError(this.exception);
}

class UpdateAdminProfileLoading extends AdminProfileState {}
class UpdateAdminProfileSuccess extends AdminProfileState {}
class UpdateAdminProfileError extends AdminProfileState {
  final Exception exception;
  UpdateAdminProfileError(this.exception);
}