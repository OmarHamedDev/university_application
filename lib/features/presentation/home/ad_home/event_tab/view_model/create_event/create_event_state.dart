part of 'create_event_cubit.dart';

@immutable
sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}
class CreateEventLoadingState extends CreateEventState{}
class CreateEventSuccessState extends CreateEventState{}
class CreateEventErrorState extends CreateEventState{
  final Exception massage;
  CreateEventErrorState(this.massage);
}
