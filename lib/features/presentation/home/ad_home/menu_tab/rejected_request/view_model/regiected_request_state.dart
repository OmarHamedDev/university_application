part of 'regiected_request_cubit.dart';

@immutable
sealed class RegiectedRequestState {}

final class RegiectedRequestInitial extends RegiectedRequestState {}
class GetAllRejectedRequestsAdminLoading extends RegiectedRequestState {}
class GetAllRejectedRequestsAdminSuccess extends RegiectedRequestState {}
class GetAllRejectedRequestsAdminError extends RegiectedRequestState {
  final Exception exception;
  GetAllRejectedRequestsAdminError({required this.exception});
}