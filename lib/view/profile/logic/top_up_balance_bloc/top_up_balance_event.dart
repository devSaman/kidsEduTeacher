part of 'top_up_balance_bloc.dart';

class TopUpBalanceEvent extends Equatable {
  const TopUpBalanceEvent();

  @override
  List<Object> get props => [];
}

class TopUpBalanceDataEvent extends TopUpBalanceEvent {
  final String teacherId;
  final String cardNumber;
  final int amount;
  const TopUpBalanceDataEvent(
      {required this.teacherId,
      required this.cardNumber,
      required this.amount});

  @override
  List<Object> get props => [];
}
