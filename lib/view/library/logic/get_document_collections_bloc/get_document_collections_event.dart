part of 'get_document_collections_bloc.dart';

abstract class GetDocumentCollectionsEvent extends Equatable {
  const GetDocumentCollectionsEvent();

  @override
  List<Object> get props => [];
}

class GetDocumentCollectionsDataEvent extends GetDocumentCollectionsEvent {}
