import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:kids_edu_teacher/data/models/auth_models/create_account_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc() : super(CreateAccountInitial()) {
    on<CreateAccountDataEvent>(createAccount);
  }

  Future<void> createAccount(
      CreateAccountDataEvent event, Emitter<CreateAccountState> emit) async {
    emit(CreateAccountInitial());
    final response = await MainRepository.createAccount(
        event.fullName, event.psw, event.phone, event.birthDate);
    if (response is CretaedAccountModel) {
      emit(CreateAccountSuccess(createdAccount: response));
    } else if (response is ErrorModel) {
      print("geege");
      emit(CreateAccountFail(errorModel: response));
      print("ERROR");
    }
  }
}
