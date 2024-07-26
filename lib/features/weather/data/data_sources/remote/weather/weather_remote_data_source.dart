import 'package:delos_weather/features/weather/data/models/weather_response.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponseModel> getWeatherList({
    required double lat,
    required double lon,
    required String units,
  });
}
