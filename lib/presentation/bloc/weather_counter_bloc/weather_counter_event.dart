part of 'weather_counter_bloc.dart';

abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {}

class AddCountEvent extends WeatherEvent {
  bool isLightTheme;
  AddCountEvent(this.isLightTheme);
}

class MinusCountEvent extends WeatherEvent {
  bool isLightTheme;
  MinusCountEvent(this.isLightTheme);
}
