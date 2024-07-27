import 'package:delos_weather/core/utils/date_formatter.dart';
import 'package:delos_weather/core/utils/weather_icon.dart';
import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:flutter/material.dart';

class WeatherDetail extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherDetail({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Weather Detail',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  _buildBody() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            DateFormatter.formatUnixDate(
              weather.dt ?? 0,
              'EEEE, MMMM d, yyyy',
            ),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormatter.formatUnixDate(
              weather.dt ?? 0,
              'h:mm a',
            ),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${weather.main?.temp ?? 0}°C',
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(width: 20),
              Image.network(
                WeatherIcon.getWeatherBySize(weather.weather?.first.icon ?? '', '2x'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '${weather.weather?.first.main ?? ''} (${weather.weather?.first.description ?? ''})',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Temp (min)',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${weather.main?.tempMin}°C',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Temp (max)',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${weather.main?.tempMax}°C',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
