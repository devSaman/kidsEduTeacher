part of 'get_banners_bloc.dart';

class GetBannersState extends Equatable {
  const GetBannersState();

  @override
  List<Object> get props => [];
}

final class GetBannersInitial extends GetBannersState {}

final class GetBannersError extends GetBannersState {
  final ErrorModel errorModel;

  const GetBannersError({required this.errorModel});
}

final class GetBannersSuccess extends GetBannersState {
  final BannersModel bannersData;

  const GetBannersSuccess({required this.bannersData});
}
