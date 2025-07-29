part of 'request_studnet_cubit.dart';

@immutable
sealed class RequestStudnetState {}

final class RequestStudentInitial extends RequestStudnetState {}

class GetAllRequestStudentLoading extends RequestStudnetState {}

class GetAllRequestStudentSuccess extends RequestStudnetState {}
class GetAllRequestStudentError extends RequestStudnetState {
  final Exception error;
  GetAllRequestStudentError(this.error);
}