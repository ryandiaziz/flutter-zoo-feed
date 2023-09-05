import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zoo_feed/features/home/repository/user_repository.dart';

import '../../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEventGetData>((event, emit) async {
      try {
        emit(UserStateLoading());
        User user = await UserRepo.getUser();
        emit(UserStateDone(user));
      } catch (e) {
        emit(UserStateError(e.toString()));
      }
    });
  }
}
