part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginDataEvent extends LoginEvent {
  final String phone;
  final String psw;

  const LoginDataEvent({required this.phone, required this.psw});
}
