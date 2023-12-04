import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';

part 'top_up_balance_event.dart';
part 'top_up_balance_state.dart';

class TopUpBalanceBloc extends Bloc<TopUpBalanceEvent, TopUpBalanceState> {
  TopUpBalanceBloc() : super(TopUpBalanceInitial()) {
    on<TopUpBalanceDataEvent>(topUpBalance);
  }

  Future<void> topUpBalance(
      TopUpBalanceDataEvent event, Emitter<TopUpBalanceState> emit) async {
    emit(TopUpBalanceInitial());
    final response = await MainRepository.topUpBalance(
        event.teacherId, event.cardNumber, event.amount);
    if (response is SuccessfulResponse) {
      print("ADDED SUCCES");
      emit(TopUpBalanceSuccess());
    } else if (response is ErrorModel) {
      emit(TopUpBalanceFail(errorModel: response));
    }
  }
}
