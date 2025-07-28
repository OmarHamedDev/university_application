part of 'upload_sheet_cubit.dart';

@immutable
sealed class UploadSheetState {}

final class UploadSheetInitial extends UploadSheetState {}
class UploadSheetLoading extends UploadSheetState {}
class UploadSheetSuccess extends UploadSheetState {}
class UploadSheetError extends UploadSheetState {
  final Exception error;
  UploadSheetError(this.error);
}
