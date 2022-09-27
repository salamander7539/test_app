part of 'change_auth_cubit.dart';

enum ChangeStatus { login, register }

class ChangeAuthState extends Equatable {
  final String? email;
  final String? password;
  final ChangeStatus status;

  const ChangeAuthState({required this.status, required this.email,
    required this.password,});

  factory ChangeAuthState.initial() {
    return ChangeAuthState(
      email: '',
      password: '',
      status: ChangeStatus.login,
    );
  }

  @override
  List<Object?> get props => [email, password, status];

  ChangeAuthState copyWith({
    String? email,
    String? password,
   ChangeStatus? status,
  }) {
    return ChangeAuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
