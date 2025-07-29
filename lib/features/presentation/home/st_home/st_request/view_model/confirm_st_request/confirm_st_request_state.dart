part of 'confirm_st_request_cubit.dart';

@immutable
sealed class ConfirmStRequestState {}

final class ConfirmStRequestInitial extends ConfirmStRequestState {}
class ConfirmStRequestLoading extends ConfirmStRequestState {}
class ConfirmStRequestSuccess extends ConfirmStRequestState {}
class ConfirmStRequestError extends ConfirmStRequestState {
  final Exception message;
  ConfirmStRequestError(this.message);
}