import 'dart:convert';

import 'package:delos_weather/features/weather/data/data_sources/local/weather/weather_local_data_source.dart';
import 'package:delos_weather/features/weather/data/models/weather_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheWeatherList(WeatherResponseModel weatherResponseModel) {
    try {
      return sharedPreferences.setString('weatherResponse', jsonEncode(weatherResponseModel.toJson()));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WeatherResponseModel> getWeatherList() async {
    try {
      final cachedJson = sharedPreferences.getString('weatherResponse');
      if (cachedJson != null) {
        return WeatherResponseModel.fromJson(jsonDecode(cachedJson) as Map<String, dynamic>);
      }
      throw Exception('No cached data');
    } catch (e) {
      rethrow;
      
    }
  }
}
