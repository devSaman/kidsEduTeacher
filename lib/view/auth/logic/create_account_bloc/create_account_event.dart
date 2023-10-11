part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();
  @override
  List<Object> get props => [];
}

class CreateAccountDataEvent extends CreateAccountEvent {
  final String fullName;
  final String birthDate;
  final String phone;
  final String psw;

  const CreateAccountDataEvent(
      {required this.fullName,
      required this.birthDate,
      required this.phone,
      required this.psw});

  @override
  List<Object> get props => [fullName, psw, phone, birthDate];
}
