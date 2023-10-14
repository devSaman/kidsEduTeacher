part of 'get_video_collections_bloc.dart';

abstract class GetVideoCollectionsEvent extends Equatable {
  const GetVideoCollectionsEvent();

  @override
  List<Object> get props => [];
}


class GetVideoCollectionsDataEvent extends GetVideoCollectionsEvent{
  
}