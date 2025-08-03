part of 'graduations_cubit.dart';

@immutable
sealed class GraduationsState {}

final class GraduationsInitial extends GraduationsState {}
final class GraduationsLoading extends GraduationsState {}
final class GraduationLoading extends GraduationsState {}
final class GraduationsSuc extends GraduationsState {}
final class GraduationSuc extends GraduationsState {}
