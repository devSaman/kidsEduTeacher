part of 'verification_bloc.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

class VerificationInitial extends VerificationState {}

class VerificationError extends VerificationState {
  final ErrorModel errorData;

  const VerificationError({required this.errorData});
}

class VerificationSuccess extends VerificationState {
  final VerificationModel verificationData;

  const VerificationSuccess({required this.verificationData});
}
