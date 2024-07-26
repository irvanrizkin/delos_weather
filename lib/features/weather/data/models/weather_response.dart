import 'package:delos_weather/features/weather/data/data_sources/_mappers/entity_convertible.dart';
import 'package:delos_weather/features/weather/data/models/weather.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponseModel extends Equatable with EntityConvertible<WeatherResponseModel, WeatherResponseEntity> {
  final List<WeatherModel>? list;
  
  const WeatherResponseModel({
    this.list,
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return _$WeatherResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherResponseModelToJson(this);
  }

  @override
  WeatherResponseEntity toEntity() {
    return WeatherResponseEntity(
      list: list?.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
    list,
  ];
}
