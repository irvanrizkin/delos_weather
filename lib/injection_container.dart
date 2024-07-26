import 'package:delos_weather/core/network/dio_client.dart';
import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source.dart';
import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source_impl.dart';
import 'package:delos_weather/features/weather/data/repository/weather_repository_impl.dart';
import 'package:delos_weather/features/weather/domain/repository/weather_repository.dart';
import 'package:delos_weather/features/weather/domain/usecases/weather_usecases.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl
    ..registerLazySingleton<DioClient>(DioClient.new)

    ..registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(sl()))

    ..registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(sl()))

    ..registerLazySingleton<WeatherUseCase>(() => WeatherUseCase(sl()))

    ..registerFactory<RemoteWeatherBloc>(() => RemoteWeatherBloc(sl()));
}
