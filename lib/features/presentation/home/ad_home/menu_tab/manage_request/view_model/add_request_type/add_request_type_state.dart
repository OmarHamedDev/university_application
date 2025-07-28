part of 'add_request_type_cubit.dart';

@immutable
sealed class AddRequestTypeState {}

final class AddRequestTypeInitial extends AddRequestTypeState {}
class AddRequestTypeLoading extends AddRequestTypeState {}
class AddRequestTypeSuccess extends AddRequestTypeState {}
class AddRequestTypeError extends AddRequestTypeState {
  final Exception exception;
  AddRequestTypeError({required this.exception});
}