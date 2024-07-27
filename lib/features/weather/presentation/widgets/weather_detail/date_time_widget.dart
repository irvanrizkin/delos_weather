import 'package:delos_weather/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.unixTime,
  });

  final int unixTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormatter.formatUnixDate(
            unixTime,
            'EEEE, MMMM d, yyyy',
          ),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          DateFormatter.formatUnixDate(
            unixTime,
            'h:mm a',
          ),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
