part of 'student_profile_cubit.dart';

@immutable
sealed class StudentProfileState {}

final class AdminProfileInitial extends StudentProfileState {}

class GetStudentProfileLoading extends StudentProfileState {}

class GetStudentProfileSuccess extends StudentProfileState {}

class GetStudentProfileError extends StudentProfileState {
  final Exception exception;
  GetStudentProfileError(this.exception);
}

class DeleteStudentProfileLoading extends StudentProfileState {}

class DeleteStudentProfileSuccess extends StudentProfileState {}

class DeleteStudentProfileError extends StudentProfileState {
  final Exception exception;
  DeleteStudentProfileError(this.exception);
}

class UpdateStudentProfileLoading extends StudentProfileState {}

class UpdateStudentProfileSuccess extends StudentProfileState {}

class UpdateStudentProfileError extends StudentProfileState {
  final Exception exception;
  UpdateStudentProfileError(this.exception);
}
