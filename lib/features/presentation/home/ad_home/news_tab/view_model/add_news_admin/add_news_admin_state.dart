part of 'add_news_admin_cubit.dart';

@immutable
sealed class AddNewsAdminState {}

final class AddNewsAdminInitial extends AddNewsAdminState {}
class CreateAdminNewsLoadingState extends AddNewsAdminState {}
class CreateAdminNewsSuccessState extends AddNewsAdminState {}
class CreateAdminNewsErrorState extends AddNewsAdminState {
  final Exception exception;
  CreateAdminNewsErrorState({required this.exception});
}