import 'package:delos_weather/core/network/dio_client.dart';
import 'package:delos_weather/features/weather/data/data_sources/remote/weather/weather_remote_data_source_impl.dart';
import 'package:delos_weather/features/weather/data/models/weather_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../_utils/json_reader.dart';
import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  dotenv.testLoad();
  late DioClient mockDioClient;
  late final WeatherRemoteDataSourceImpl weatherRemoteDataSource;

  late final WeatherResponseModel tWeatherResponseModel;

  late final dynamic weatherResponseJson;

  setUpAll(() {
    mockDioClient = MockDioClient();
    weatherRemoteDataSource = WeatherRemoteDataSourceImpl(mockDioClient);

    weatherResponseJson = jsonReader('weather_dummy_data.json');

    tWeatherResponseModel = WeatherResponseModel.fromJson(weatherResponseJson);
  });

  group('getWeatherList', () {
    const lat = -6.175115064391812;
    const lon = 106.86503988647461;
    const units = 'metric';

    late final Response<dynamic> response;

    setUpAll(() {
      response = Response<dynamic>(
        data: weatherResponseJson,
        requestOptions: RequestOptions(
          path: '/data/2.5/forecast',
        ),
      );
    });
    
    test('should return [WeatherResponseModel] when the call is success', () async {
      when(mockDioClient.get(
        '/data/2.5/forecast',
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => response);

      final result = await weatherRemoteDataSource.getWeatherList(
        lat: lat,
        lon: lon,
        units: units,
      );

      expect(result, tWeatherResponseModel);
    });
  });
}
