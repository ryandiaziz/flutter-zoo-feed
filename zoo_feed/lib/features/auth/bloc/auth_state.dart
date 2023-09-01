part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateComplete extends AuthState {}

class AuthStateError extends AuthState {
  final String message;

  AuthStateError(this.message);
}
