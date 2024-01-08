part of 'make_order_bloc.dart';

class MakeOrderState extends Equatable {
  const MakeOrderState();

  @override
  List<Object> get props => [];
}

final class MakeOrderInitial extends MakeOrderState {}

final class MakeOrderError extends MakeOrderState {
  final ErrorModel errorModel;

  const MakeOrderError({required this.errorModel});
}

final class MakeOrderSuccess extends MakeOrderState {}
