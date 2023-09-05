part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  final ThemeMode mode;

  const ThemeState(this.mode);
}

class ThemeStateLight extends ThemeState {
  const ThemeStateLight(super.mode);
}

class ThemeStateDark extends ThemeState {
  const ThemeStateDark(super.mode);
}
