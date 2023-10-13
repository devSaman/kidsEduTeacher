part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordFail extends ChangePasswordState {
  final ErrorModel errorModel;

  const ChangePasswordFail({required this.errorModel});
}

class ChangePasswordSuccess extends ChangePasswordState {
  final CretaedAccountModel successData;

  const ChangePasswordSuccess({required this.successData});
}
