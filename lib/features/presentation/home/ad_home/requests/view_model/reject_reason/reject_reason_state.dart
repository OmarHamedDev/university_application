part of 'reject_reason_cubit.dart';

@immutable
sealed class RejectReasonState {}

final class RejectReasonInitial extends RejectReasonState {}
class RejectReasonLoading extends RejectReasonState {}
class RejectReasonSuccess extends RejectReasonState {}
class RejectReasonError extends RejectReasonState {
  final Exception message;
  RejectReasonError({required this.message});
}