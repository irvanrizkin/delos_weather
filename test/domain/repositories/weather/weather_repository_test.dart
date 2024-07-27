import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source.dart';
import 'package:delos_weather/features/weather/data/models/weather.dart';
import 'package:delos_weather/features/weather/data/models/weather_item.dart';
import 'package:delos_weather/features/weather/data/models/weather_main.dart';
import 'package:delos_weather/features/weather/data/models/weather_response.dart';
import 'package:delos_weather/features/weather/data/repository/weather_repository_impl.dart';
import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_item.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_main.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_response.dart';
import 'package:delos_weather/features/weather/domain/repository/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final WeatherRepository weatherRepository;
  late final WeatherRemoteDataSource mockWeatherRemoteDataSource;

  late final WeatherResponseModel tWeatherResponseModel;
  late final WeatherModel tWeatherModel;
  late final WeatherMainModel tWeatherMainModel;
  late final WeatherItemModel tWeatherItemModel;

  late final WeatherResponseEntity tWeatherResponseEntity;
  late final WeatherEntity tWeatherEntity;
  late final WeatherMainEntity tWeatherMainEntity;
  late final WeatherItemEntity tWeatherItemEntity;

  setUpAll(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepository = WeatherRepositoryImpl(mockWeatherRemoteDataSource);

    tWeatherMainModel = const WeatherMainModel(
      temp: 30.0,
      tempMin: 30.0,
      tempMax: 30.0,
    );

    tWeatherMainEntity = const WeatherMainEntity(
      temp: 30.0,
      tempMin: 30.0,
      tempMax: 30.0,
    );

    tWeatherItemModel = const WeatherItemModel(
      main: 'Clear',
      description: 'clear sky',
      icon: '01d',
    );

    tWeatherItemEntity = const WeatherItemEntity(
      main: 'Clear',
      description: 'clear sky',
      icon: '01d',
    );

    tWeatherModel = WeatherModel(
      main: tWeatherMainModel,
      weather: [tWeatherItemModel],
    );

    tWeatherEntity = WeatherEntity(
      main: tWeatherMainEntity,
      weather: [tWeatherItemEntity],
    );

    tWeatherResponseModel = WeatherResponseModel(
      list: [tWeatherModel],
    );

    tWeatherResponseEntity = WeatherResponseEntity(
      list: [tWeatherEntity],
    );
  });

  group('getWeatherList', () {
    const lat = -6.175115064391812;
    const lon = 106.86503988647461;
    const units = 'metric';
    
    test('should return [WeatherResponseEntity] when success call remote data source', () async {
      when(mockWeatherRemoteDataSource.getWeatherList(
        lat: lat,
        lon: lon,
        units: units,
      )).thenAnswer((_) async => tWeatherResponseModel);

      final result = await weatherRepository.getWeatherList(
        lat: lat,
        lon: lon,
        units: units,
      );

      expect(result, equals(Right(tWeatherResponseEntity)));
      verify(mockWeatherRemoteDataSource.getWeatherList(
        lat: lat,
        lon: lon,
        units: units,
      ));
      verifyNoMoreInteractions(mockWeatherRemoteDataSource);
    });
  });
}
