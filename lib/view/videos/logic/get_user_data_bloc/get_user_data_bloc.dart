import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/get_user_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'get_user_data_event.dart';
part 'get_user_data_state.dart';

class GetUserDataBloc extends Bloc<GetUserDataEvent, GetUserDataState> {
  GetUserDataBloc() : super(GetUserDataInitial()) {
    on<GetUserData>(getUserData);
  }

  Future<void> getUserData(
      GetUserData event, Emitter<GetUserDataState> emit) async {
    emit(GetUserDataInitial());
    final response = await MainRepository.getUserData();
    if (response is UserModel) {
      emit(GetUserDataSuccess(userData: response));
    } else if (response is ErrorModel) {
      emit(GetUserDataError(errorData: response));
    }
  }
}
