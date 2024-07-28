import 'package:delos_weather/core/constants/constants.dart';
import 'package:delos_weather/features/weather/domain/entities/city.dart';
import 'package:delos_weather/features/weather/domain/usecases/weather_usecases.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_event.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

class RemoteWeatherBloc extends Bloc<RemoteWeatherEvent, RemoteWeatherState> {
  final WeatherUseCase _weatherUseCase;

  final List<CityEntity> cities = [
    const CityEntity(name: 'Surabaya', latitude: -7.245607, longitude: 112.737870),
    const CityEntity(name: 'Yogyakarta', latitude: -7.792609, longitude: 110.365852),
    const CityEntity(name: 'Ngawi', latitude: -7.410802, longitude: 111.443336),
    const CityEntity(name: 'Malang', latitude: -7.977308, longitude: 112.634213),
  ];

  RemoteWeatherBloc(this._weatherUseCase) : super(const RemoteWeatherLoading()) {
    on <GetWeathers> (onGetWeathers);
    on <GetWeatherByCity> (onGetWeatherByCity);
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

  void onGetWeatherByCity(GetWeatherByCity event, Emitter<RemoteWeatherState> emit) async {
    final weatherResponse = await _weatherUseCase.getWeatherList(
      lat: event.latitude,
      lon: event.longitude,
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
