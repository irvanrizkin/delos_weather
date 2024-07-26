import 'package:delos_weather/features/weather/data/data_sources/_mappers/entity_convertible.dart';
import 'package:delos_weather/features/weather/data/models/weather_item.dart';
import 'package:delos_weather/features/weather/data/models/weather_main.dart';
import 'package:delos_weather/features/weather/domain/entities/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable with EntityConvertible<WeatherModel, WeatherEntity> {
  final int? dt;
  final WeatherMainModel? main;
  final List<WeatherItemModel>? weather;
  
  const WeatherModel({
    this.dt,
    this.main,
    this.weather,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return _$WeatherModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherModelToJson(this);
  }

  @override
  WeatherEntity toEntity() {
    return WeatherEntity(
      dt: dt,
      main: main?.toEntity(),
      weather: weather?.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
    dt,
    main,
    weather,
  ];
}
