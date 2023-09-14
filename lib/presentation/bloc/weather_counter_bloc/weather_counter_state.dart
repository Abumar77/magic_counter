part of 'weather_counter_bloc.dart';

class WeatherState extends Equatable {
  Statuses status;
  String? weatherInfo;
  int count;

  WeatherState(
      {this.status = Statuses.initial, this.weatherInfo, this.count = 0});

  WeatherState copyWith({
    String? weatherInfo,
    Statuses? status,
    int? count,
  }) {
    return WeatherState(
      weatherInfo: weatherInfo ?? this.weatherInfo,
      status: status ?? this.status,
      count: count ?? this.count,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [weatherInfo, status, count];
}
