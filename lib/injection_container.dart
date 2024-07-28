import 'package:delos_weather/core/network/dio_client.dart';
import 'package:delos_weather/features/weather/data/data_sources/local/weather/weather_local_data_source.dart';
import 'package:delos_weather/features/weather/data/data_sources/local/weather/weather_local_data_source_impl.dart';
import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source.dart';
import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source_impl.dart';
import 'package:delos_weather/features/weather/data/repository/weather_repository_impl.dart';
import 'package:delos_weather/features/weather/domain/repository/weather_repository.dart';
import 'package:delos_weather/features/weather/domain/usecases/weather_usecases.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  sl
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)

    ..registerLazySingleton<DioClient>(DioClient.new)

    ..registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(sl()))
    ..registerLazySingleton<WeatherLocalDataSource>(() => WeatherLocalDataSourceImpl(sl()))

    ..registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(sl(), sl()))

    ..registerLazySingleton<WeatherUseCase>(() => WeatherUseCase(sl()))

    ..registerFactory<RemoteWeatherBloc>(() => RemoteWeatherBloc(sl()));
}
