import 'package:bloc_test/bloc_test.dart';
import 'package:delos_weather/core/exceptions/network/network_exception.dart';
import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_item.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_main.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_response.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_bloc.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_event.dart';
import 'package:delos_weather/features/weather/presentation/bloc/weather/remote/remote_weather_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late MockWeatherUseCase mockWeatherUseCase;
  late RemoteWeatherBloc remoteWeatherBloc;

  setUp(() {
    mockWeatherUseCase = MockWeatherUseCase();
    remoteWeatherBloc = RemoteWeatherBloc(mockWeatherUseCase);
  });

  const testWeatherMain = WeatherMainEntity(
    temp: 30.0,
    tempMin: 30.0,
    tempMax: 30.0,
  );

  const testWeatherItem = WeatherItemEntity(
    main: 'Clear',
    description: 'clear sky',
    icon: '01d',
  );

  const testWeather = WeatherEntity(
    main: testWeatherMain,
    weather: [testWeatherItem],
  );

  const testWeatherResponse = WeatherResponseEntity(
    list: [testWeather],
  );

  const lat = -6.175115064391812;
  const lon = 106.86503988647461;
  const units = 'metric';

  test(
    'initial state should be [RemoteWeatherLoading]',
    () {
      // assert
      expect(remoteWeatherBloc.state, const RemoteWeatherLoading());
    },
  );

  blocTest<RemoteWeatherBloc, RemoteWeatherState>(
    'should emit [RemoteWeatherDone] when success get weather by city',
    build: () {
      provideDummy<Either<NetworkException, WeatherResponseEntity>>(
        const Right(testWeatherResponse),
      );

      when(
        mockWeatherUseCase.getWeatherList(
          lat: lat,
          lon: lon,
          units: units,
        ),
      ).thenAnswer((_) async => const Right(testWeatherResponse));

      return remoteWeatherBloc;
    },
    act: (bloc) => bloc.add(const GetWeatherByCity("Jakarta", lat, lon)),
    expect: () => [
      RemoteWeatherDone(testWeatherResponse),
    ],
  );
}
