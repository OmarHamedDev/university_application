sealed class Result<T>{}
class Success<T> extends Result<T>{
  final T  data;
  Success({required this.data});
}
class Failures<T> extends Result<T>{
  final Exception exception;
  Failures({required this.exception});
}