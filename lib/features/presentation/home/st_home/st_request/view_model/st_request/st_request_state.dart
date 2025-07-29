part of 'st_request_cubit.dart';

@immutable
sealed class StRequestState {}

final class StRequestInitial extends StRequestState {}
class StRequestLoadingState extends StRequestState {}
class StRequestSuccessState extends StRequestState {}
class StRequestErrorState extends StRequestState {
  final Exception message;
  StRequestErrorState(this.message);
}