part of 'add_card_bloc.dart';

class AddCardEvent extends Equatable {
  const AddCardEvent();

  @override
  List<Object> get props => [];
}

class AddCardDataEvent extends AddCardEvent {
  final String name;
  final String number;
  final String expiration;
  final bool isMain;

  const AddCardDataEvent(
      {required this.name,
      required this.number,
      required this.expiration,
      required this.isMain});
}

class ConfirmCardEvent extends AddCardEvent {
  final String number;
  final String code;

  const ConfirmCardEvent({
    required this.number,
    required this.code,
  });
}
