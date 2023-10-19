import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/auth_models/vaerification_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc() : super(VerificationInitial()) {
    on<VerificationDataEvent>(verification);
  }

  Future<void> verification(
      VerificationDataEvent event, Emitter<VerificationState> emit) async {
    emit(VerificationInitial());
    final response = await MainRepository.verification(
        event.phone, event.code, event.fromCreate);
    if (response is VerificationModel) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await _prefs.setString('userId', response.data!.userId!);
      emit(VerificationSuccess(verificationData: response));
    } else if (response is ErrorModel) {
      emit(VerificationError(errorData: response));
    }
  }
}
