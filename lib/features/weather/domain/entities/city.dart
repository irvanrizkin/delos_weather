import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String name;
  final double latitude;
  final double longitude;

  const CityEntity({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props {
    return [
      name,
      latitude,
      longitude,
    ];
  }
}
