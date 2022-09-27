import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_auth_state.dart';

class ChangeAuthCubit extends Cubit<ChangeAuthState> {
  ChangeAuthCubit() : super(ChangeAuthState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void changeStatus() {
    if (state.status == ChangeStatus.login) {
      emit(state.copyWith(status: ChangeStatus.register));
    } else {
      emit(state.copyWith(status: ChangeStatus.login));
    }
    print(state.status);
  }
}
