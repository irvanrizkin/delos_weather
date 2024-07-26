import 'dart:io';

import 'package:delos_weather/core/network/models/error_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class NetworkException extends Equatable implements Exception {
  late final String message;
  late final int? statusCode;

  NetworkException.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioException.error.runtimeType == SocketException) {
          message = 'Connection to API server failed due to internet connection';
          break;
        } else {
          message = 'Connection to API server failed';
          break;
        }
      
      case DioExceptionType.badCertificate:
        message = 'Invalid certificate';
        break;

      case DioExceptionType.badResponse:
        final model = NetworkErrorModel.fromJson(dioException.response?.data as Map<String, dynamic>);
        message = model.message ?? 'Unexpected bad response';
        break;

      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }
  }

  @override
  List<Object?> get props => [
    message,
    statusCode,
  ];
}
