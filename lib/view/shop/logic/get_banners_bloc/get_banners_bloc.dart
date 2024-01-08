import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/banner_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'get_banners_event.dart';
part 'get_banners_state.dart';

class GetBannersBloc extends Bloc<GetBannersEvent, GetBannersState> {
  GetBannersBloc() : super(GetBannersInitial()) {
    on<GetAllBannersData>(getBanners);
  }
  Future<void> getBanners(
      GetAllBannersData event, Emitter<GetBannersState> emit) async {
    emit(GetBannersInitial());
    final response = await MainRepository.getAllBanners();
    if (response is BannersModel) {
      emit(GetBannersSuccess(bannersData: response));
    } else if (response is ErrorModel) {
      emit(GetBannersError(errorModel: response));
    }
  }
}
