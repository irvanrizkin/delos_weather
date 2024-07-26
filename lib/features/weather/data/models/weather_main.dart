import 'package:delos_weather/features/weather/data/data_sources/_mappers/entity_convertible.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_main.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_main.g.dart';

@JsonSerializable()
class WeatherMainModel extends Equatable with EntityConvertible<WeatherMainModel, WeatherMainEntity> {
  final double? temp;
  @JsonKey(name: 'temp_min')
  final double? tempMin;
  @JsonKey(name: 'temp_max')
  final double? tempMax;
  
  const WeatherMainModel({
    this.temp,
    this.tempMin,
    this.tempMax,
  });

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) {
    return _$WeatherMainModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherMainModelToJson(this);
  }

  @override
  WeatherMainEntity toEntity() {
    return WeatherMainEntity(
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax,
    );
  }

  @override
  List<Object?> get props => [
    temp,
    tempMin,
    tempMax,
  ];
}
