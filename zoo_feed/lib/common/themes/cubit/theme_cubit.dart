import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);
  void changeTheme() => emit(!state);
}
