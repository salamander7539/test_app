import 'package:app_test/screens/ResultScreen/view/result_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app_test/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());


  login({required String email, required String password}) async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.logInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } catch(_) {}
  }
}
