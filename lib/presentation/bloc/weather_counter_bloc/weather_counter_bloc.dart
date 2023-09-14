import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:magic_counter/domain/usecases/get_weather.dart';

import '../../../utils/core/enum.dart';
import '../../../utils/links.dart';

part 'weather_counter_event.dart';
part 'weather_counter_state.dart';

class WeatherCounterBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;
  WeatherCounterBloc(this.getWeather) : super(WeatherState()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(
        state.copyWith(status: Statuses.loading),
      );

      final response = await getWeather.call(NoParams());
      response.fold(
        (left) => emit(
          state.copyWith(
            status: Statuses.error,
          ),
        ),
        (right) => emit(
          state.copyWith(
            status: Statuses.success,
            weatherInfo: right,
          ),
        ),
      );
    });
    on<AddCountEvent>(
      (event, emit) async {
        if (state.count < 10) {
          if (event.isLightTheme) {
            emit(
              state.copyWith(count: state.count + 1),
            );
            print(state.count);
          } else if (event.isLightTheme == false) {
            if (state.count == 9) {
              emit(
                state.copyWith(count: state.count + 1),
              );
            } else {
              emit(
                state.copyWith(count: state.count + 2),
              );
            }
          }
        }
      },
    );
    on<MinusCountEvent>(
      (event, emit) async {
        if (state.count > 0) {
          if (event.isLightTheme) {
            emit(
              state.copyWith(count: state.count - 1),
            );
          } else if (event.isLightTheme == false) {
            if (state.count == 1) {
              emit(
                state.copyWith(count: state.count - 1),
              );
            } else {
              emit(
                state.copyWith(count: state.count - 2),
              );
            }
          }
        }
      },
    );
  }
}
