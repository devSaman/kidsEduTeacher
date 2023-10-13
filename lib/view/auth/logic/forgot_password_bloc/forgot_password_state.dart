part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordFail extends ForgotPasswordState {
  final ErrorModel errorData;

  const ForgotPasswordFail({required this.errorData});
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final CretaedAccountModel loginData;

  const ForgotPasswordSuccess({required this.loginData});
}
