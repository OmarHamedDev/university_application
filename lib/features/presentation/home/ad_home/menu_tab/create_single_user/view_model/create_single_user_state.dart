part of 'create_single_user_cubit.dart';

@immutable
sealed class CreateSingleUserState {}

final class CreateSingleUserInitial extends CreateSingleUserState {}
class CreateSingleUserLoading extends CreateSingleUserState {}
class CreateSingleUserSuccess extends CreateSingleUserState {}
class CreateSingleUserError extends CreateSingleUserState {
  final Exception error;
  CreateSingleUserError(this.error);
}