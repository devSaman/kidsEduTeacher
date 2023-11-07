part of 'get_shop_data_bloc.dart';

class GetShopDataState extends Equatable {
  const GetShopDataState();

  @override
  List<Object> get props => [];
}

class GetShopDataInitial extends GetShopDataState {}

class GetShopDataSuccess extends GetShopDataState {
  final ShopMainModel shopMainModel;

  const GetShopDataSuccess({required this.shopMainModel});
}

class GetShopDataFail extends GetShopDataState {
  final ErrorModel errorModel;

  const GetShopDataFail({required this.errorModel});
}
