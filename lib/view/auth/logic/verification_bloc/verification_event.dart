part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object> get props => [];
}

class VerificationDataEvent extends VerificationEvent {
  final String phone;
  final String code;
  final bool fromCreate;

  const VerificationDataEvent(
      {required this.fromCreate, required this.phone, required this.code});
  @override
  List<Object> get props => [fromCreate, phone, code];
}
