import 'package:flutter/material.dart';

class TemperatureMinMaxWidget extends StatelessWidget {
  final String minTemperature;
  final String maxTemperature;

  const TemperatureMinMaxWidget({
    super.key,
    required this.minTemperature,
    required this.maxTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              '$minTemperature°C',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
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