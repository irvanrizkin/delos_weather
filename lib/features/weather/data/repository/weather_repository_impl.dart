import 'package:delos_weather/core/exceptions/network/network_exception.dart';
import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_response.dart';
import 'package:dio/dio.dart';
import 'package:delos_weather/features/weather/domain/repository/weather_repository.dart';
import 'package:fpdart/fpdart.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepositoryImpl(this._weatherRemoteDataSource);

  @override
  Future<Either<NetworkException, WeatherResponseEntity>> getWeatherList({
    required double lat,
    required double lon,
    required String units
  }) async {
    try {
      final result = await _weatherRemoteDataSource.getWeatherList(
        lat: lat,
        lon: lon,
        units: units
      );
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }  
  }
}
