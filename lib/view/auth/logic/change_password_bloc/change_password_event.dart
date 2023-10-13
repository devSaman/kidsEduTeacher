part of 'change_password_bloc.dart';

class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordDataEvent extends ChangePasswordEvent {
  final String phone;
  final String psw;

  const ChangePasswordDataEvent({
    required this.phone,
    required this.psw,
  });
  @override
  List<Object> get props => [phone, psw];
}
