import 'package:delos_weather/features/weather/data/data_sources/_mappers/entity_convertible.dart';
import 'package:delos_weather/features/weather/domain/entities/weather_item.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_item.g.dart';

@JsonSerializable()
class WeatherItemModel extends Equatable with EntityConvertible<WeatherItemModel, WeatherItemEntity> {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherItemModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherItemModel.fromJson(Map<String, dynamic> json) {
    return _$WeatherItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherItemModelToJson(this);
  }

  @override
  WeatherItemEntity toEntity() {
    return WeatherItemEntity(
      id: id,
      main: main,
      description: description,
      icon: icon,
    );
  }

  @override
  List<Object?> get props => [
    id,
    main,
    description,
    icon,
  ];
}
