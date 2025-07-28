part of 'confirm_request_cubit.dart';

@immutable
sealed class ConfirmRequestState {}

final class ConfirmRequestInitial extends ConfirmRequestState {}
class GetAllConfirmRequestLoadingState extends ConfirmRequestState {}
 class GetAllConfirmRequestSuccessState extends ConfirmRequestState {}
class GetAllConfirmRequestErrorState extends ConfirmRequestState {
  final Exception exception;
  GetAllConfirmRequestErrorState({required this.exception});
}


class AcceptRequestLoadingState extends ConfirmRequestState {}
class AcceptRequestSuccessState extends ConfirmRequestState {}
class AcceptRequestErrorState extends ConfirmRequestState {
  final Exception exception;
  AcceptRequestErrorState({required this.exception});
}

class RejectRequestLoadingState extends ConfirmRequestState {}
class RejectRequestSuccessState extends ConfirmRequestState {}
class RejectRequestErrorState extends ConfirmRequestState {
  final Exception exception;
  RejectRequestErrorState({required this.exception});
}