import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeStateLight(ThemeMode.light)) {
    on<ThemeEventChangeMode>((event, emit) {
      if (state.mode == ThemeMode.light) {
        emit(const ThemeStateDark(ThemeMode.dark));
      } else {
        emit(const ThemeStateLight(ThemeMode.light));
      }
    });
  }
}
