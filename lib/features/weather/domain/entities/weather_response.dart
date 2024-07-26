import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:equatable/equatable.dart';

class WeatherResponseEntity extends Equatable {
  final List<WeatherEntity>? list;

  const WeatherResponseEntity({
    this.list,
  });

  @override
  List<Object?> get props {
    return [
      list,
    ];
  }
}
