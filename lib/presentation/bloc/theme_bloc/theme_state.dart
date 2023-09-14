part of 'theme_bloc.dart';

class ThemeState {
  final ThemeData themeData;

  ThemeState({required this.themeData});

  ThemeState copyWith({
    ThemeData? themeData,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }
}
