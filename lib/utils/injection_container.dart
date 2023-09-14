import 'package:get_it/get_it.dart';
import 'package:magic_counter/data/datasources/weather_remote_data_source.dart';
import 'package:magic_counter/domain/repositories/get_weather_repo.dart';
import 'package:magic_counter/domain/usecases/get_weather.dart';
import 'package:magic_counter/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:magic_counter/presentation/bloc/weather_counter_bloc/weather_counter_bloc.dart';

import '../data/repositories/get_weather_repo_impl.dart';

final ls = GetIt.instance;

Future<void> setup() async {
  /// Blocs
  //  Weather
  ls.registerFactory<WeatherCounterBloc>(() => WeatherCounterBloc(ls()));
  ls.registerFactory<ThemeBloc>(() => ThemeBloc());

  /// Repos

  //  Weather
  ls.registerLazySingleton<GetWeatherRepo>(
    () => WeatherRepoImpl(remoteDataSource: ls()),
  );

  ///usecases
  // Weather
  ls.registerLazySingleton<GetWeather>(
    () => GetWeather(ls()),
  );

  /// data sources
  //  Weather
  ls.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(),
  );
}
