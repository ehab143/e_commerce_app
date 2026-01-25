import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with apiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with apiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Received timeout with apiServer');

      // case DioExceptionType.badCertificate:
      //   return ServerFailure('There was a problem in SSL certificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to  apiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        // if (dioError.message!.contains('SocketException')) {
        //   return ServerFailure('No Internet Connection');
        // }
        return ServerFailure('Unexpected error ,please try again');
      default:
        return ServerFailure('Oops there was an error please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request is not found ,please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error ,please try later');
    } else {
      return ServerFailure('Oops there was an error ,please try again');
    }
  }
}
