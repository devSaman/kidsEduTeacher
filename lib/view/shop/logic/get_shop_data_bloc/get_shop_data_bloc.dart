import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'get_shop_data_event.dart';
part 'get_shop_data_state.dart';

class GetShopDataBloc extends Bloc<GetShopDataEvent, GetShopDataState> {
  GetShopDataBloc() : super(GetShopDataInitial()) {
    on<ShopEvent>(getShopData);
  }
  Future<void> getShopData(
      ShopEvent event, Emitter<GetShopDataState> emit) async {
    emit(GetShopDataInitial());
    final response = await MainRepository.getShopData();
    if (response is ShopMainModel) {
      print("CONFIRMED SUCCES");
      emit(GetShopDataSuccess(shopMainModel: response));
    } else if (response is ErrorModel) {
      emit(GetShopDataFail(errorModel: response));
    }
  }
}
