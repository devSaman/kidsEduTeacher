import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/payment_card_models/card_create_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';

part 'add_card_event.dart';
part 'add_card_state.dart';

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc() : super(AddCardInitial()) {
    on<AddCardDataEvent>(addCard);
    on<ConfirmCardEvent>(confirmCard);
  }

  Future<void> addCard(
      AddCardDataEvent event, Emitter<AddCardState> emit) async {
    emit(AddCardInitial());
    final response = await MainRepository.addCard(
        event.name, event.number, event.expiration, event.isMain);
    if (response is CreateCardModel) {
      print("ADDED SUCCES");
      emit(AddCardSuccess(successCard: response));
    } else if (response is ErrorModel) {
      emit(AddCardFail(errorData: response));
    }
  }

  Future<void> confirmCard(
      ConfirmCardEvent event, Emitter<AddCardState> emit) async {
    emit(ConfirmCardInitial());
    final response = await MainRepository.confirmCard(event.number, event.code);
    if (response is SuccessfulResponse) {
      print("CONFIRMED SUCCES");
      emit(const ConfirmCardSuccess());
    } else if (response is ErrorModel) {
      emit(ConfirmCardFail(errorData: response));
    }
  }
}
