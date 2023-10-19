part of 'get_document_collections_bloc.dart';

abstract class GetDocumentCollectionsState extends Equatable {
  const GetDocumentCollectionsState();

  @override
  List<Object> get props => [];
}

final class GetDocumentCollectionsInitial extends GetDocumentCollectionsState {}

final class GetDocumentCollectionsFail extends GetDocumentCollectionsState {
  final ErrorModel errorModel;

  const GetDocumentCollectionsFail({required this.errorModel});
}

final class GetDocumentCollectionsSuccess extends GetDocumentCollectionsState {
  final VideoCollectionsModel documentCollections;

  const GetDocumentCollectionsSuccess({required this.documentCollections});
}
