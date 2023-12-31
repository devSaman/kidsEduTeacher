part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordDataEvent extends ForgotPasswordEvent {
  final String phoneNumber;

  const ForgotPasswordDataEvent({required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}
