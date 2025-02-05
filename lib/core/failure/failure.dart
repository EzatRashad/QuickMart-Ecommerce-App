import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      // Handle Connection DioExceptions
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the API server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the API server');
      // Handle DioExceptions with response
       
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to the API server was canceled');

      case DioExceptionType.unknown:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error occurred. Please try again!');

      default:
        return ServerFailure('Oops! There was an error. Please try again.');
    }
  }

// Handle DioExceptions with response data by status code
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure('Unknown error occurred. Please try again.');
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(response['error']?['message'] ??
            'Authentication error. Please try again.');

      case 404:
        return ServerFailure('Request not found. Please try later.');

      case 500:
        return ServerFailure('Internal server error. Please try later.');

      default:
        return ServerFailure('Oops! There was an error. Please try again.');
    }
  }
}
