import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/auth_models/create_account_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordDataEvent>(changePsw);
  }

  Future<void> changePsw(
      ChangePasswordDataEvent event, Emitter<ChangePasswordState> emit) async {
    emit(ChangePasswordInitial());
    final response = await MainRepository.changePsw(event.phone, event.psw);
    if (response is CretaedAccountModel) {
      emit(ChangePasswordSuccess(successData: response));
    } else if (response is ErrorModel) {
      emit(ChangePasswordFail(errorModel: response));
    }
  }
}
