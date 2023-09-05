part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateDone extends UserState {
  final User user;

  UserStateDone(this.user);
}

class UserStateError extends UserState {
  final String message;

  UserStateError(this.message);
}
