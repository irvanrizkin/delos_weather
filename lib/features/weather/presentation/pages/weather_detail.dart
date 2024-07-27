import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:delos_weather/features/weather/presentation/widgets/weather_detail/date_time_widget.dart';
import 'package:delos_weather/features/weather/presentation/widgets/weather_detail/temperature_icon_widget.dart';
import 'package:delos_weather/features/weather/presentation/widgets/weather_detail/temperature_min_max_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherDetail extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherDetail({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.weatherDetail,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          DateTimeWidget(
            unixTime: weather.dt ?? 0,
          ),
          const SizedBox(height: 10),
          TemperatureIconWidget(
            temperature: weather.main?.temp.toString() ?? '',
            icon: weather.weather?.first.icon ?? '',
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
          TemperatureMinMaxWidget(
            minTemperatureLabel: AppLocalizations.of(context)!.tempMin,
            minTemperature: weather.main?.tempMin.toString() ?? '',
            maxTemperatureLabel: AppLocalizations.of(context)!.tempMax,
            maxTemperature: weather.main?.tempMax.toString() ?? '',
          )
        ],
      ),
    );
  }
}
