import 'dart:developer';
import 'dart:io';

import 'package:delos_weather/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio();

    _dio
      ..options.baseUrl = Constants().weatherApibaseUrl
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      }
      ..options.connectTimeout = const Duration(milliseconds: 5000)
      ..options.receiveTimeout = const Duration(milliseconds: 5000)
      ..options.responseType = ResponseType.json;
      // ..interceptors.add(
      //   PrettyDioLogger(
      //     compact: false,
      //     logPrint: (object) => log(object.toString(), name: 'OpenWeather API'),
      //   )
      // );
  }

  Future<Response<dynamic>> get (
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
