import 'package:delos_weather/core/constants/constants.dart';
import 'package:delos_weather/features/weather/domain/usecases/weather_usecases.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_event.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

class RemoteWeatherBloc extends Bloc<RemoteWeatherEvent, RemoteWeatherState> {
  final WeatherUseCase _weatherUseCase;

  RemoteWeatherBloc(this._weatherUseCase) : super(const RemoteWeatherLoading()) {
    on <GetWeathers> (onGetWeathers);
  }

  void onGetWeathers(GetWeathers event, Emitter<RemoteWeatherState> emit) async {
    final weatherResponse = await _weatherUseCase.getWeatherList(
      lat: Constants().weatherLatitude,
      lon: Constants().weatherLongitude,
      units: "metric"
    );

    if (weatherResponse.isLeft()) {
      emit(
        RemoteWeatherError((weatherResponse as Left).value)
      );
    }

    if (weatherResponse.isRight()) {
      emit(
        RemoteWeatherDone((weatherResponse as Right).value)
      );
    }
  }
}