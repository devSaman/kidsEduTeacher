import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';

part 'get_document_collections_event.dart';
part 'get_document_collections_state.dart';

class GetDocumentCollectionsBloc
    extends Bloc<GetDocumentCollectionsEvent, GetDocumentCollectionsState> {
  GetDocumentCollectionsBloc() : super(GetDocumentCollectionsInitial()) {
    on<GetDocumentCollectionsDataEvent>(getVideoCollections);
  }

  Future<void> getVideoCollections(GetDocumentCollectionsDataEvent event,
      Emitter<GetDocumentCollectionsState> emit) async {
    emit(GetDocumentCollectionsInitial());
    final response = await MainRepository.getDocumentCollections();
    if (response is VideoCollectionsModel) {
      emit(GetDocumentCollectionsSuccess(documentCollections: response));
    } else if (response is ErrorModel) {
      emit(GetDocumentCollectionsFail(errorModel: response));
    }
  }
}
