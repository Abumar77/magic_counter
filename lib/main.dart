import 'package:flutter/material.dart';
import 'package:magic_counter/presentation/bloc/weather_counter_bloc/weather_counter_bloc.dart';
import 'package:magic_counter/utils/app_router.dart';
import 'utils/links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ls<WeatherCounterBloc>()),
        BlocProvider(create: (context) => ls<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.themeData,
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
