part of 'regiect_request_cubit.dart';

@immutable
sealed class RegiectRequestState {}

final class RegiectRequestInitial extends RegiectRequestState {}
class RegiectRequestLoading extends RegiectRequestState {}
class RegiectRequestSuccess extends RegiectRequestState {}
class RegiectRequestError extends RegiectRequestState {
  final Exception message;
  RegiectRequestError({required this.message});
}