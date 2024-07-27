import 'package:delos_weather/core/utils/weather_icon.dart';
import 'package:flutter/material.dart';

class TemperatureIconWidget extends StatelessWidget {
  final String temperature;
  final String icon;

  const TemperatureIconWidget({
    super.key,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$temperature°C',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        const SizedBox(width: 20),
        Image.network(
          WeatherIcon.getWeatherBySize(icon, '2x'),
        ),
      ],
    );
  }
}
