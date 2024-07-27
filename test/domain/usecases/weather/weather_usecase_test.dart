import 'package:delos_weather/core/exceptions/network/network_exception.dart';
import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_item.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_main.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_response.dart';
import 'package:delos_weather/features/weather/domain/repository/weather_repository.dart';
import 'package:delos_weather/features/weather/domain/usecases/weather_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final WeatherRepository mockWeatherRepository;
  late final WeatherUseCase weatherUseCase;

  late final WeatherItemEntity tWeatherItemEntity;
  late final WeatherMainEntity tWeatherMainEntity;
  late final WeatherEntity tWeatherEntity;
  late final WeatherResponseEntity tWeatherResponseEntity;

  setUpAll(() {
    mockWeatherRepository = MockWeatherRepository();
    weatherUseCase = WeatherUseCase(mockWeatherRepository);

    tWeatherMainEntity = const WeatherMainEntity(
      temp: 30.0,
      tempMin: 30.0,
      tempMax: 30.0,
    );

    tWeatherItemEntity = const WeatherItemEntity(
      main: 'Clear',
      description: 'clear sky',
      icon: '01d',
    );

    tWeatherEntity = WeatherEntity(
      main: tWeatherMainEntity,
      weather: [tWeatherItemEntity],
    );

    tWeatherResponseEntity = WeatherResponseEntity(
      list: [tWeatherEntity],
    );
  });

  group('getWeatherList', () {
    const lat = -6.175115064391812;
    const lon = 106.86503988647461;
    const units = 'metric';

    setUp(() {
      provideDummy<Either<NetworkException, WeatherResponseEntity>>(Right(tWeatherResponseEntity));
    });

    test('should return [WeatherResponseEntity] when success call repository', () async {
      when(mockWeatherRepository.getWeatherList(
        lat: lat,
        lon: lon,
        units: units,
      )).thenAnswer((_) async => Right(tWeatherResponseEntity));

      final result = await weatherUseCase.getWeatherList(
        lat: lat,
        lon: lon,
        units: units,
      );

      expect(result, Right(tWeatherResponseEntity));
      verify(mockWeatherRepository.getWeatherList(
        lat: lat,
        lon: lon,
        units: units,
      ));
      verifyNoMoreInteractions(mockWeatherRepository);
    });
  });
}
