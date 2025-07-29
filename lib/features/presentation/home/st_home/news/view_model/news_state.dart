part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
class GetAllNewsLoadingState extends NewsState {}
class GetAllNewsErrorState extends NewsState {
  final Exception exception;
  GetAllNewsErrorState(this.exception);
}
class GetAllNewsSuccessState extends NewsState {}