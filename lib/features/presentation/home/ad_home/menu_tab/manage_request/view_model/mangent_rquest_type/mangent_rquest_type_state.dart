part of 'mangent_rquest_type_cubit.dart';

@immutable
sealed class MangentRquestTypeState {}

final class MangentRquestTypeInitial extends MangentRquestTypeState {}

class GetAllRequestTypeLoading extends MangentRquestTypeState {}

class GetAllRequestTypeSuccess extends MangentRquestTypeState {}
class GetAllRequestTypeError extends MangentRquestTypeState {
  final Exception exception;
  GetAllRequestTypeError({required this.exception});
}

class DeleteRequestTypeLoading extends MangentRquestTypeState {}
class DeleteRequestTypeSuccess extends MangentRquestTypeState {}
class DeleteRequestTypeError extends MangentRquestTypeState {
  final Exception exception;
  DeleteRequestTypeError({required this.exception});
}
