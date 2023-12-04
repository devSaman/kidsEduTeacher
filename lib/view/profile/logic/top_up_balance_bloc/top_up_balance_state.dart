part of 'top_up_balance_bloc.dart';

class TopUpBalanceState extends Equatable {
  const TopUpBalanceState();

  @override
  List<Object> get props => [];
}

class TopUpBalanceInitial extends TopUpBalanceState {}

class TopUpBalanceFail extends TopUpBalanceState {
  final ErrorModel errorModel;

  const TopUpBalanceFail({required this.errorModel});
}

class TopUpBalanceSuccess extends TopUpBalanceState {}
