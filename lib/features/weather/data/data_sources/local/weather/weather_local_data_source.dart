import 'package:delos_weather/features/weather/data/models/weather_response.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheWeatherList(WeatherResponseModel weatherResponseModel);

  Future<WeatherResponseModel> getWeatherList();
}
