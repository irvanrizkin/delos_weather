import 'package:flutter/material.dart';

class TemperatureMinMaxWidget extends StatelessWidget {
  final String minTemperatureLabel;
  final String minTemperature;
  final String maxTemperatureLabel;
  final String maxTemperature;

  const TemperatureMinMaxWidget({
    super.key,
    required this.minTemperatureLabel,
    required this.minTemperature,
    required this.maxTemperatureLabel,
    required this.maxTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              minTemperatureLabel,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '$minTemperature°C',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              maxTemperatureLabel,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '$maxTemperature°C',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}