import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'get_video_collections_event.dart';
part 'get_video_collections_state.dart';

class GetVideoCollectionsBloc
    extends Bloc<GetVideoCollectionsEvent, GetVideoCollectionsState> {
  GetVideoCollectionsBloc() : super(GetVideoCollectionsInitial()) {
    on<GetVideoCollectionsDataEvent>(getVideoCollections);
  }
  Future<void> getVideoCollections(GetVideoCollectionsDataEvent event,
      Emitter<GetVideoCollectionsState> emit) async {
    emit(GetVideoCollectionsInitial());
    final response = await MainRepository.getVideoCollections();
    if (response is VideoCollectionsModel) {
      emit(GetVideoCollectionsSuccess(videoCollections: response));
    } else if (response is ErrorModel) {
      emit(GetVideoCollectionsFail(errorModel: response));
    }
  }
}
