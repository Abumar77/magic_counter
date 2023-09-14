// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WeatherModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
    };

WeatherModelData _$WeatherModelDataFromJson(Map<String, dynamic> json) =>
    WeatherModelData(
      cityName: json['city_name'] as String?,
      countryCode: json['country_code'] as String?,
      stateCode: json['state_code'] as String?,
      temp: (json['temp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherModelDataToJson(WeatherModelData instance) =>
    <String, dynamic>{
      'city_name': instance.cityName,
      'state_code': instance.stateCode,
      'country_code': instance.countryCode,
      'temp': instance.temp,
    };
