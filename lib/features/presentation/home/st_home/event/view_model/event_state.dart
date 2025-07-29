part of 'event_cubit.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}
class StEventsLoadingState extends EventState {}
class StEventsLoadedState extends EventState {}
class StEventsErrorState extends EventState {
  final Exception exception;

  StEventsErrorState({required this.exception});
}