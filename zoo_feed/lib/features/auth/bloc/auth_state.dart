part of 'auth_bloc.dart';

abstract class AuthState {
  SharedPreferences? accessToken;

  AuthState(this.accessToken);
}

class AuthStateInitial extends AuthState {
  AuthStateInitial(super.accessToken);
}

class AuthStateLoading extends AuthState {
  AuthStateLoading(super.accessToken);
}

class AuthStateComplete extends AuthState {
  AuthStateComplete(super.accessToken);
}

class AuthStateError extends AuthState {
  final String message;

  AuthStateError(this.message) : super(null);
}
