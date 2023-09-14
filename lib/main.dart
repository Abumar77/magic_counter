import 'package:flutter/material.dart';
import 'package:magic_counter/presentation/bloc/weather_counter_bloc/weather_counter_bloc.dart';
import 'utils/links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ls<WeatherCounterBloc>()),
        BlocProvider(create: (context) => ls<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
