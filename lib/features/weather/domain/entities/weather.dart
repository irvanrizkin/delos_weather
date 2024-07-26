import 'package:delos_weather/features/weather/domain/entities/weather_item.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_main.dart';
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final int? dt;
  final WeatherMainEntity? main;
  final List<WeatherItemEntity>? weather;

  const WeatherEntity({
    this.dt,
    this.main,
    this.weather,
  });

  @override
  List<Object?> get props {
    return [
      dt,
      main,
      weather,
    ];
  }
}
