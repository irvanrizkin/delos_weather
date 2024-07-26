import 'package:delos_weather/core/exceptions/network/network_exception.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class WeatherRepository {
  Future<Either<NetworkException, WeatherResponseEntity>> getWeatherList({
    required double lat,
    required double lon,
    required String units,
  });
}
