import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/auth_models/create_account_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordDataEvent>(forgotPassword);
  }

  Future<void> forgotPassword(
      ForgotPasswordDataEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordInitial());
    final response = await MainRepository.forgotPassword(event.phoneNumber);
    if (response is CretaedAccountModel) {
      emit(ForgotPasswordSuccess(loginData: response));
    } else if (response is ErrorModel) {
      emit(ForgotPasswordFail(errorData: response));
    }
  }
}
