import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_response.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteWeatherState extends Equatable {
  final List<WeatherEntity>? weathers;
  final DioException? error;

  const RemoteWeatherState({this.weathers, this.error});

  @override
  List<Object?> get props => [weathers!, error!];
}

class RemoteWeatherLoading extends RemoteWeatherState {
  const RemoteWeatherLoading();
}

class RemoteWeatherDone extends RemoteWeatherState {
  RemoteWeatherDone(WeatherResponseEntity weatherResponse) : super(weathers: weatherResponse.list);
}

class RemoteWeatherError extends RemoteWeatherState {
  const RemoteWeatherError(DioException error) : super(error: error);
}
