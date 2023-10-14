part of 'get_video_collections_bloc.dart';

abstract class GetVideoCollectionsState extends Equatable {
  const GetVideoCollectionsState();

  @override
  List<Object> get props => [];
}

class GetVideoCollectionsInitial extends GetVideoCollectionsState {}

class GetVideoCollectionsFail extends GetVideoCollectionsState {
  final ErrorModel errorModel;

  const GetVideoCollectionsFail({required this.errorModel});
}

class GetVideoCollectionsSuccess extends GetVideoCollectionsState {
  final VideoCollectionsModel videoCollections;

  const GetVideoCollectionsSuccess({required this.videoCollections});
}
