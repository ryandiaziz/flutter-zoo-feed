import 'package:bloc/bloc.dart';
import 'package:zoo_feed/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateInitial()) {
    on<AuthEventLogin>(
      ((event, emit) async {
        try {
          emit(AuthStateLoading());
          await AuthRepo.login(
            email: event.email,
            password: event.password,
          );
          emit(AuthStateComplete());
        } catch (e) {
          emit(
            AuthStateError(e.toString()),
          );
        }
      }),
    );

    on<AuthEventLogout>((event, emit) async {
      try {
        emit(AuthStateLoading());
        await AuthRepo.logout();
        emit(AuthStateComplete());
      } catch (e) {
        emit(AuthStateError(e.toString()));
      }
    });
  }
}
