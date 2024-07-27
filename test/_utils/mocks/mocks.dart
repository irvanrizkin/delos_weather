import 'package:delos_weather/core/network/dio_client.dart';
import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source.dart';
import 'package:delos_weather/features/weather/domain/repository/weather_repository.dart';
import 'package:delos_weather/features/weather/domain/usecases/weather_usecases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DioClient,
  WeatherRemoteDataSource,
  WeatherRepository,
  WeatherUseCase,
])
void main() {}
