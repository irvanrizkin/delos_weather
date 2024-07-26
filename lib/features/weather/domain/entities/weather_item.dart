import 'package:equatable/equatable.dart';

class WeatherItemEntity extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherItemEntity({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  @override
  List<Object?> get props {
    return [
      id,
      main,
      description,
      icon,
    ];
  }
}
