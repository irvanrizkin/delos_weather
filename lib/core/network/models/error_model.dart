import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class NetworkErrorModel extends Equatable {
  @JsonKey(name: 'cod')
  final int? statusCode;
  @JsonKey(name: 'message')
  final String? message;

  const NetworkErrorModel({
    this.statusCode,
    this.message,
  });

  factory NetworkErrorModel.fromJson(Map<String, dynamic> json) {
    return _$NetworkErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NetworkErrorModelToJson(this);
  }

  @override
  List<Object?> get props {
    return [
      statusCode,
      message,
    ];
  }
}
