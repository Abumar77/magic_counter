import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_counter/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:magic_counter/presentation/bloc/weather_counter_bloc/weather_counter_bloc.dart';

import '../../utils/core/enum.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Counter"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: BlocBuilder<WeatherCounterBloc, WeatherState>(
              builder: (context, state) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width - 50,
                        child: Text(
                          state.weatherInfo ??
                              "Press the icon to get your location",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        "You have pushed the button this many times:\n${state.count}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                            onPressed: () => context
                                .read<WeatherCounterBloc>()
                                .add(GetWeatherEvent()),
                            child: Icon(Icons.cloud),
                          ),
                          context.read<ThemeBloc>().state.themeData ==
                                  ThemeData.light()
                              ? FloatingActionButton(
                                  onPressed: () {
                                    context
                                        .read<ThemeBloc>()
                                        .add(ThemeToggleDarkEvent());
                                  },
                                  child: Icon(Icons.nightlight_round),
                                )
                              : FloatingActionButton(
                                  onPressed: () {
                                    context
                                        .read<ThemeBloc>()
                                        .add(ThemeToggleLightEvent());
                                  },
                                  child: Icon(Icons.sunny),
                                )
                        ],
                      ),
                    ),
                    BlocBuilder<WeatherCounterBloc, WeatherState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              state.count != 10
                                  ? FloatingActionButton(
                                      onPressed: () {
                                        context.read<WeatherCounterBloc>().add(
                                            AddCountEvent(context
                                                    .read<ThemeBloc>()
                                                    .state
                                                    .themeData ==
                                                ThemeData.light()));
                                      },
                                      child: Icon(Icons.add),
                                    )
                                  : SizedBox(
                                      width: 40,
                                      height: 40,
                                    ),
                              state.count != 0
                                  ? FloatingActionButton(
                                      onPressed: () {
                                        context.read<WeatherCounterBloc>().add(
                                            MinusCountEvent(context
                                                    .read<ThemeBloc>()
                                                    .state
                                                    .themeData ==
                                                ThemeData.light()));
                                      },
                                      child: Icon(Icons.remove),
                                    )
                                  : SizedBox(
                                      width: 40,
                                      height: 40,
                                    ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
