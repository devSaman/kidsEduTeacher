import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/make_order_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';

part 'make_order_event.dart';
part 'make_order_state.dart';

class MakeOrderBloc extends Bloc<MakeOrderEvent, MakeOrderState> {
  MakeOrderBloc() : super(MakeOrderInitial()) {
    on<MakeOrderDataEvent>(makeOrder);
  }

  Future<void> makeOrder(
      MakeOrderDataEvent event, Emitter<MakeOrderState> emit) async {
    emit(MakeOrderInitial());
    final response = await MainRepository.makeOrder(event.orderData);
    if (response is SuccessfulResponse) {
      emit(MakeOrderSuccess());
    } else if (response is ErrorModel) {
      emit(MakeOrderError(errorModel: response));
    }
  }
}
