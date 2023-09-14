import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  final int? count;
  final List<WeatherModelData>? data;

  WeatherModel({
    this.count,
    this.data,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class WeatherModelData {
  @JsonKey(name: "city_name")
  final String? cityName;
  @JsonKey(name: "state_code")
  final String? stateCode;
  @JsonKey(name: "country_code")
  final String? countryCode;
  final double? temp;

  WeatherModelData({
    this.cityName,
    this.countryCode,
    this.stateCode,
    this.temp,
  });

  factory WeatherModelData.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelDataToJson(this);
}
