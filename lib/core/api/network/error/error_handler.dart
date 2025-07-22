import 'package:dio/dio.dart';
import 'error_massage.dart';
import 'error_model.dart';

class ErrorHandler {
  ErrorHandler._();

  static ErrorModel formException(Exception exception) {
    if (exception is DioException) {
      return _formDioExceptions(exception);
    } else {
      return ErrorModel(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }

  static ErrorModel _formDioExceptions(DioException dioExceptions) {
    switch (dioExceptions.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorModel(errorMassage: ErrorMassage.connectionErrorMessage);
      case DioExceptionType.badCertificate:
        return ErrorModel(errorMassage: ErrorMassage.badCertificateMessage);
      case DioExceptionType.badResponse:
        return _handleResponse(dioExceptions.response);
      case DioExceptionType.connectionError:
        return ErrorModel(errorMassage: ErrorMassage.connectionErrorMessage);
      default:
        return ErrorModel(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }

  static ErrorModel _handleResponse(Response? response) {
    if (response != null) {
      return _formResponse(response);
    } else {
      return ErrorModel(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }

  static ErrorModel _formResponse(Response response) {
    final statusCode = response.statusCode;
    final responseData = response.data;
    final message =
        responseData is Map<String, dynamic> ? responseData["message"] : null;

    if (statusCode == 400) {
      return ErrorModel(
        errorMassage: message ?? ErrorMassage.badResponseMassage,
        code: 400,
      );
    } else if (statusCode == 401 || statusCode == 403) {
      return ErrorModel(
        errorMassage: message ?? ErrorMassage.unauthorizedMessage,
        code: statusCode,
      );
    } else if (statusCode == 409) {
      return ErrorModel(
        errorMassage: message ?? ErrorMassage.conflictMessage,
        code: 409,
      );
    } else if (statusCode == 404) {
      return ErrorModel(
        errorMassage: ErrorMassage.notFoundMessage,
        code: 404,
      );
    } else if (statusCode! >= 500) {
      return ErrorModel(
        errorMassage: ErrorMassage.internalServerErrorMessage,
        code: 500,
      );
    } else {
      return ErrorModel(errorMassage: ErrorMassage.unknownErrorMessage);
    }
  }
}
