part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object> get props => [];
}

class VerificationDataEvent extends VerificationEvent {
  final String phone;
  final String code;

  const VerificationDataEvent({required this.phone, required this.code});
  @override
  List<Object> get props => [phone, code];
}
