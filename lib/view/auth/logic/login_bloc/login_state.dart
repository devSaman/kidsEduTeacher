part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginFail extends LoginState {
  final ErrorModel errorData;

  const LoginFail({required this.errorData});
}

class LoginSuccess extends LoginState {
  final CretaedAccountModel loginData;

  const LoginSuccess({required this.loginData});
}
