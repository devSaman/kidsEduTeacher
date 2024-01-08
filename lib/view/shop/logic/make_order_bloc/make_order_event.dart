part of 'make_order_bloc.dart';

class MakeOrderEvent extends Equatable {
  const MakeOrderEvent();

  @override
  List<Object> get props => [];
}

class MakeOrderDataEvent extends MakeOrderEvent {
  final MakeOrderModel orderData;

  const MakeOrderDataEvent({required this.orderData});
}
