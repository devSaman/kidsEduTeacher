part of 'get_user_data_bloc.dart';

abstract class GetUserDataState extends Equatable {
  const GetUserDataState();

  @override
  List<Object> get props => [];
}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataError extends GetUserDataState {
  final ErrorModel errorData;

  const GetUserDataError({required this.errorData});
}

final class GetUserDataSuccess extends GetUserDataState {
  final UserModel userData;

  const GetUserDataSuccess({required this.userData});
}
