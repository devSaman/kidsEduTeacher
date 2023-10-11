part of 'create_account_bloc.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();
  @override
  List<Object> get props => [];
}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountFail extends CreateAccountState {
  final ErrorModel errorModel;

  const CreateAccountFail({required this.errorModel});
}

class CreateAccountSuccess extends CreateAccountState {
  final CretaedAccountModel createdAccount;

  const CreateAccountSuccess({required this.createdAccount});
}
