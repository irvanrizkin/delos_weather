import 'package:equatable/equatable.dart';

class WeatherMainEntity extends Equatable {
  final double? temp;
  final double? tempMin;
  final double? tempMax;

  const WeatherMainEntity({
    this.temp,
    this.tempMin,
    this.tempMax,
  });

  @override
  List<Object?> get props {
    return [
      temp,
      tempMin,
      tempMax,
    ];
  }
}
