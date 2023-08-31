part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthEventLogin extends AuthEvent {}

class AuthEventRegister extends AuthEvent {}

class AuthEventLogout extends AuthEvent {}
