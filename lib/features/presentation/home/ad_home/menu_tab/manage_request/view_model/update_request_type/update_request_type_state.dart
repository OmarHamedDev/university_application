part of 'update_request_type_cubit.dart';

@immutable
sealed class UpdateRequestTypeState {}

final class UpdateRequestTypeInitial extends UpdateRequestTypeState {}
class UpdateRequestTypeLoading extends UpdateRequestTypeState {}
class UpdateRequestTypeSuccess extends UpdateRequestTypeState {}
class UpdateRequestTypeError extends UpdateRequestTypeState {
  final Exception exception;
  UpdateRequestTypeError({required this.exception});
}