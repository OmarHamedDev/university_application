part of 'accepted_request_cubit.dart';

@immutable
sealed class AcceptedRequestState {}

final class AcceptedRequestInitial extends AcceptedRequestState {}
class GetAllAcceptedRequestsAdminLoading extends AcceptedRequestState {}
class GetAllAcceptedRequestsAdminSuccess extends AcceptedRequestState {}
class GetAllAcceptedRequestsAdminError extends AcceptedRequestState {
  final Exception exception;
   GetAllAcceptedRequestsAdminError({required this.exception});
}