import 'package:cached_network_image/cached_network_image.dart';
import 'package:delos_weather/core/utils/date_formatter.dart';
import 'package:delos_weather/core/utils/weather_icon.dart';
import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  final int unixTime;
  final String weather;
  final String temperatureLabel;
  final double temperature;
  final String icon;
  final Function()? onTap;

  const WeatherTile({
    super.key,
    required this.unixTime,
    required this.weather,
    required this.temperatureLabel,
    required this.temperature,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        DateFormatter.formatUnixDate(
          unixTime,
          'EEE, MMM d, yyyy h:mm a',
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(weather),
          Text('$temperatureLabel: $temperature°C'),
        ],
      ),
      leading: CachedNetworkImage(
        imageUrl: WeatherIcon.getWeather(icon),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      onTap: onTap,
    );
  }
}
