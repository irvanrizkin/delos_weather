import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:delos_weather/features/weather/presentation/pages/weather_detail.dart';
import 'package:delos_weather/features/weather/presentation/pages/weather_list.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static getRouter() {
    return GoRouter(
      initialLocation: '/list',
      routes: [
        GoRoute(
          name: 'list',
          path: '/list',
          builder: (context, state) => const WeatherList(),
        ),
        GoRoute(
          name: 'detail',
          path: '/detail',
          builder: (context, state) {
            final weather = state.extra as WeatherEntity;
            return WeatherDetail(weather: weather);
          },
        )
      ]
    );
  }
}
