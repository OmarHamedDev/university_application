part of 'st_home_tab_cubit.dart';

sealed class StHomeTabState {}

class StHomeTabInitial extends StHomeTabState {}
 class StHomeTbEventsLoading extends StHomeTabState {}
class StHomeTabEventsLoadedState extends StHomeTabState {}
class StHomeTabEventsErrorState extends StHomeTabState {
  final Exception exception;
  StHomeTabEventsErrorState({required this.exception});
} class StHomeTabNewsLoading extends StHomeTabState {}

class StHomeTabNewsLoadedState extends StHomeTabState {}
class StHomeTabNewsErrorState extends StHomeTabState {
  final Exception exception;
  StHomeTabNewsErrorState({required this.exception});
}
