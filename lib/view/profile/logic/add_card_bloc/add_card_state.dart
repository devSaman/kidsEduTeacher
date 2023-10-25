part of 'add_card_bloc.dart';

class AddCardState extends Equatable {
  const AddCardState();

  @override
  List<Object> get props => [];
}

final class AddCardInitial extends AddCardState {}

final class AddCardSuccess extends AddCardState {
  final CreateCardModel successCard;

  const AddCardSuccess({required this.successCard});
}

final class AddCardFail extends AddCardState {
  final ErrorModel errorData;

  const AddCardFail({required this.errorData});
}

final class ConfirmCardInitial extends AddCardState {}

final class ConfirmCardSuccess extends AddCardState {
  const ConfirmCardSuccess();
}

final class ConfirmCardFail extends AddCardState {
  final ErrorModel errorData;

  const ConfirmCardFail({required this.errorData});
}
