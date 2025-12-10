import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout in connection with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout in connection with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate received from server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet connection');
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          return ServerFailure('No Internet connection');
        } else {
          return ServerFailure(
            dioException.message ??
                'An unexpected error occurred. Please try again later.',
          );
        }
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure('Unknown server error');
    }

    switch (statusCode) {
      case 400:
        return ServerFailure('Bad request');
      case 401:
        return ServerFailure('Unauthorized request');
      case 403:
        return ServerFailure('Access forbidden');
      case 404:
        return ServerFailure('Resource not found');
      case 500:
        return ServerFailure('Internal server error');
      default:
        return ServerFailure('Unexpected error [Code: $statusCode]');
    }
  }
}
