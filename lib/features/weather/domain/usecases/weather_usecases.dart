import 'package:delos_weather/core/exceptions/network/network_exception.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_response.dart';
import 'package:delos_weather/features/weather/domain/repository/weather_repository.dart';
import 'package:fpdart/fpdart.dart';

class WeatherUseCase {
  final WeatherRepository _weatherRepository;

  const WeatherUseCase(this._weatherRepository);

  Future<Either<NetworkException, WeatherResponseEntity>> getWeatherList({
    required double lat,
    required double lon,
    required String units,
  }) async {
    return _weatherRepository.getWeatherList(
      lat: lat,
      lon: lon,
      units: units,
    );
  }
}
