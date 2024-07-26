import 'package:delos_weather/core/constants/constants.dart';
import 'package:delos_weather/core/network/dio_client.dart';
import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source.dart';
import 'package:delos_weather/features/weather/data/models/weather_response.dart';

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final DioClient _dioClient;

  const WeatherRemoteDataSourceImpl(this._dioClient);

  @override
  Future<WeatherResponseModel> getWeatherList({
    required double lat,
    required double lon,
    required String units
  }) async {
    try {
      final response = await _dioClient.get(
        '/data/2.5/forecast',
        queryParameters: {
          'appId': Constants().weatherApiKey,
          'lat': lat,
          'lon': lon,
          'units': units,
        },
      );
      final model = WeatherResponseModel.fromJson(response.data as Map<String, dynamic>);
      return model;
    } catch (_) {
      rethrow;
    }
  }
}
