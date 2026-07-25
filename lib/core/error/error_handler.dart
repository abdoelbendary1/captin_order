import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return const Failure.networkError('Network connection timeout.');
        case DioExceptionType.badResponse:
          return Failure.serverError(
            error.response?.data?['message'] ?? 'Server response error.',
          );
        default:
          return const Failure.unknownError('Network error occurred.');
      }
    }
    return Failure.unknownError(error?.toString() ?? 'An unexpected error occurred.');
  }
}