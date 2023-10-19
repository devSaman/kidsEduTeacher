import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/auth_models/create_account_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginDataEvent>(login);
  }

  Future<void> login(LoginDataEvent event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    final response = await MainRepository.login(event.phone, event.psw);
    if (response is CretaedAccountModel) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
       await _prefs.setString('userId', response.data.userId!);
      emit(LoginSuccess(loginData: response));
    } else if (response is ErrorModel) {
      emit(LoginFail(errorData: response));
    }
  }
}
