import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:magic_counter/utils/core/enum.dart';

part 'theme_state.dart';
part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: ThemeData.light())) {
    on<ThemeToggleDarkEvent>((event, emit) async {
      emit(
        state.copyWith(themeData: ThemeData.dark()),
      );
    });
    on<ThemeToggleLightEvent>((event, emit) async {
      emit(
        state.copyWith(themeData: ThemeData.light()),
      );
    });
  }
}
