import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoo_feed/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateInitial(null)) {
    on<AuthEventLogin>(
      ((event, emit) async {
        try {
          emit(AuthStateLoading(null));
          await AuthRepo.login(
            email: event.email,
            password: event.password,
          );
          emit(AuthStateComplete(null));
        } catch (e) {
          emit(
            AuthStateError(e.toString()),
          );
        }
      }),
    );

    on<AuthEventLogout>((event, emit) async {
      try {
        emit(AuthStateLoading(null));
        await AuthRepo.logout();
        emit(AuthStateComplete(null));
      } catch (e) {
        emit(AuthStateError(e.toString()));
      }
    });
  }
}
