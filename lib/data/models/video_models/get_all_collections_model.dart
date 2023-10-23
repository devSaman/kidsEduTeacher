import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kids_edu_teacher/data/responses/response_data.dart';

class VideoCollectionsModel extends ResponseData {
  String? message;
  List<VideoCollectionModel>? data;
  VideoCollectionsModel({
    this.message,
    this.data,
  });

  VideoCollectionsModel copyWith({
    String? message,
    List<VideoCollectionModel>? data,
  }) {
    return VideoCollectionsModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (message != null) {
      result.addAll({'message': message});
    }
    if (data != null) {
      result.addAll({'data': data!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory VideoCollectionsModel.fromMap(Map<String, dynamic> map) {
    return VideoCollectionsModel(
      message: map['message'],
      data: map['data'] != null
          ? List<VideoCollectionModel>.from(
              map['data']?.map((x) => VideoCollectionModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoCollectionsModel.fromJson(String source) =>
      VideoCollectionsModel.fromMap(json.decode(source));

  @override
  String toString() => 'VideoCollectionsModel(message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoCollectionsModel &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class Cover1 {
  String? cover3;
  Cover1({
    this.cover3,
  });
 

  Cover1 copyWith({
    String? cover3,
  }) {
    return Cover1(
      cover3: cover3 ?? this.cover3,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(cover3 != null){
      result.addAll({'cover3': cover3});
    }
  
    return result;
  }

  factory Cover1.fromMap(Map<String, dynamic> map) {
    return Cover1(
      cover3: map['cover3'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Cover1.fromJson(String source) => Cover1.fromMap(json.decode(source));

  @override
  String toString() => 'Cover1(cover3: $cover3)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Cover1 &&
      other.cover3 == cover3;
  }

  @override
  int get hashCode => cover3.hashCode;
}

class VideoCollectionModel {
  String? id;
  String? name;
  VideoCoverModel? cover;
  String? description;
  List<String>? auditory;
  bool? isDeleted;
  String? updatedAt;
  String? createdAt;
  List<VideoModel>? videos;
  List<VideoModel>? documents;
  VideoCollectionModel({
    this.id,
    this.name,
    this.cover,
    this.description,
    this.auditory,
    this.isDeleted,
    this.updatedAt,
    this.createdAt,
    this.videos,
    this.documents,
  });

  VideoCollectionModel copyWith({
    String? id,
    String? name,
    VideoCoverModel? cover,
    String? description,
    List<String>? auditory,
    bool? isDeleted,
    String? updatedAt,
    String? createdAt,
    List<VideoModel>? videos,
    List<VideoModel>? documents,
  }) {
    return VideoCollectionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cover: cover ?? this.cover,
      description: description ?? this.description,
      auditory: auditory ?? this.auditory,
      isDeleted: isDeleted ?? this.isDeleted,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      videos: videos ?? this.videos,
      documents: documents ?? this.documents,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (cover != null) {
      result.addAll({'cover': cover!.toMap()});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (auditory != null) {
      result.addAll({'auditory': auditory});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (videos != null) {
      result.addAll({'videos': videos!.map((x) => x.toMap()).toList()});
    }
     if (documents != null) {
      result.addAll({'documents': documents!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory VideoCollectionModel.fromMap(Map<String, dynamic> map) {
    return VideoCollectionModel(
      id: map['id'],
      name: map['name'],
      cover:
          map['cover'] != null ? VideoCoverModel.fromMap(map['cover']) : null,
      description: map['description'],
      auditory: List<String>.from(map['auditory']),
      isDeleted: map['isDeleted'],
      updatedAt: map['updatedAt'],
      createdAt: map['createdAt'],
      videos: map['videos'] != null
          ? List<VideoModel>.from(
              map['videos']?.map((x) => VideoModel.fromMap(x)))
          : null,
          documents: map['documents'] != null
          ? List<VideoModel>.from(
              map['documents']?.map((x) => VideoModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoCollectionModel.fromJson(String source) =>
      VideoCollectionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoCollectionModel(id: $id, documents:$documents, name: $name, cover: $cover, description: $description, auditory: $auditory, isDeleted: $isDeleted, updatedAt: $updatedAt, createdAt: $createdAt, videos: $videos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VideoCollectionModel &&
        other.id == id &&
        other.name == name &&
        other.cover == cover &&
        other.description == description &&
        listEquals(other.auditory, auditory) &&
        other.isDeleted == isDeleted &&
        other.updatedAt == updatedAt &&
        other.createdAt == createdAt &&
        listEquals(other.videos, videos)&&
        listEquals(other.documents, documents);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        cover.hashCode ^
        description.hashCode ^
        auditory.hashCode ^
        isDeleted.hashCode ^
        updatedAt.hashCode ^
        createdAt.hashCode ^
        documents.hashCode^
        videos.hashCode;
  }
}

class VideoModel {
  String? name;
  String? link;
  String? description;
  num? favorited;
  num? shared;
  num? views;
  String? originalName;
  VideoCoverModel? cover;
  String? mimetype;
  String? extension;
  String? filename;
  num? size;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? id;
  VideoModel({
    this.name,
    this.link,
    this.description,
    this.favorited,
    this.shared,
    this.views,
    this.originalName,
    this.cover,
    this.mimetype,
    this.extension,
    this.filename,
    this.size,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.id,
  });
  

  VideoModel copyWith({
    String? name,
    String? link,
    String? description,
    num? favorited,
    num? shared,
    num? views,
    String? originalName,
    VideoCoverModel? cover,
    String? mimetype,
    String? extension,
    String? filename,
    num? size,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    String? id,
  }) {
    return VideoModel(
      name: name ?? this.name,
      link: link ?? this.link,
      description: description ?? this.description,
      favorited: favorited ?? this.favorited,
      shared: shared ?? this.shared,
      views: views ?? this.views,
      originalName: originalName ?? this.originalName,
      cover: cover ?? this.cover,
      mimetype: mimetype ?? this.mimetype,
      extension: extension ?? this.extension,
      filename: filename ?? this.filename,
      size: size ?? this.size,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(name != null){
      result.addAll({'name': name});
    }
    if(link != null){
      result.addAll({'link': link});
    }
    if(description != null){
      result.addAll({'description': description});
    }
    if(favorited != null){
      result.addAll({'favorited': favorited});
    }
    if(shared != null){
      result.addAll({'shared': shared});
    }
    if(views != null){
      result.addAll({'views': views});
    }
    if(originalName != null){
      result.addAll({'originalName': originalName});
    }
    if(cover != null){
      result.addAll({'cover': cover!.toMap()});
    }
    if(mimetype != null){
      result.addAll({'mimetype': mimetype});
    }
    if(extension != null){
      result.addAll({'extension': extension});
    }
    if(filename != null){
      result.addAll({'filename': filename});
    }
    if(size != null){
      result.addAll({'size': size});
    }
    if(isDeleted != null){
      result.addAll({'isDeleted': isDeleted});
    }
    if(createdAt != null){
      result.addAll({'createdAt': createdAt});
    }
    if(updatedAt != null){
      result.addAll({'updatedAt': updatedAt});
    }
    if(id != null){
      result.addAll({'id': id});
    }
  
    return result;
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      name: map['name'],
      link: map['link'],
      description: map['description'],
      favorited: map['favorited'],
      shared: map['shared'],
      views: map['views'],
      originalName: map['originalName'],
      cover: map['cover'] != null ? VideoCoverModel.fromMap(map['cover']) : null,
      mimetype: map['mimetype'],
      extension: map['extension'],
      filename: map['filename'],
      size: map['size'],
      isDeleted: map['isDeleted'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) => VideoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoModel(name: $name, link: $link, description: $description, favorited: $favorited, shared: $shared, views: $views, originalName: $originalName, cover: $cover, mimetype: $mimetype, extension: $extension, filename: $filename, size: $size, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is VideoModel &&
      other.name == name &&
      other.link == link &&
      other.description == description &&
      other.favorited == favorited &&
      other.shared == shared &&
      other.views == views &&
      other.originalName == originalName &&
      other.cover == cover &&
      other.mimetype == mimetype &&
      other.extension == extension &&
      other.filename == filename &&
      other.size == size &&
      other.isDeleted == isDeleted &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      link.hashCode ^
      description.hashCode ^
      favorited.hashCode ^
      shared.hashCode ^
      views.hashCode ^
      originalName.hashCode ^
      cover.hashCode ^
      mimetype.hashCode ^
      extension.hashCode ^
      filename.hashCode ^
      size.hashCode ^
      isDeleted.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      id.hashCode;
  }
}

class VideoCoverModel {
  String? originalName;
  String? mimetype;
  String? extension;
  String? filename;
  List<Cover1>? additionalParameters;
  num? size;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  String? id;
  VideoCoverModel({
    this.originalName,
    this.mimetype,
    this.extension,
    this.filename,
    this.additionalParameters,
    this.size,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  VideoCoverModel copyWith({
    String? originalName,
    String? mimetype,
    String? extension,
    String? filename,
    List<Cover1>? additionalParameters,
    num? size,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    String? id,
  }) {
    return VideoCoverModel(
      originalName: originalName ?? this.originalName,
      mimetype: mimetype ?? this.mimetype,
      extension: extension ?? this.extension,
      filename: filename ?? this.filename,
      additionalParameters: additionalParameters ?? this.additionalParameters,
      size: size ?? this.size,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(originalName != null){
      result.addAll({'originalName': originalName});
    }
    if(mimetype != null){
      result.addAll({'mimetype': mimetype});
    }
    if(extension != null){
      result.addAll({'extension': extension});
    }
    if(filename != null){
      result.addAll({'filename': filename});
    }
    if(additionalParameters != null){
      result.addAll({'additionalParameters': additionalParameters!.map((x) => x.toMap()).toList()});
    }
    if(size != null){
      result.addAll({'size': size});
    }
    if(isDeleted != null){
      result.addAll({'isDeleted': isDeleted});
    }
    if(createdAt != null){
      result.addAll({'createdAt': createdAt});
    }
    if(updatedAt != null){
      result.addAll({'updatedAt': updatedAt});
    }
    if(id != null){
      result.addAll({'id': id});
    }
  
    return result;
  }

  factory VideoCoverModel.fromMap(Map<String, dynamic> map) {
    return VideoCoverModel(
      originalName: map['originalName'],
      mimetype: map['mimetype'],
      extension: map['extension'],
      filename: map['filename'],
      additionalParameters: map['additionalParameters'] != null ? List<Cover1>.from(map['additionalParameters']?.map((x) => Cover1.fromMap(x))) : null,
      size: map['size'],
      isDeleted: map['isDeleted'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoCoverModel.fromJson(String source) => VideoCoverModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoCoverModel(originalName: $originalName, mimetype: $mimetype, extension: $extension, filename: $filename, additionalParameters: $additionalParameters, size: $size, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is VideoCoverModel &&
      other.originalName == originalName &&
      other.mimetype == mimetype &&
      other.extension == extension &&
      other.filename == filename &&
      listEquals(other.additionalParameters, additionalParameters) &&
      other.size == size &&
      other.isDeleted == isDeleted &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.id == id;
  }

  @override
  int get hashCode {
    return originalName.hashCode ^
      mimetype.hashCode ^
      extension.hashCode ^
      filename.hashCode ^
      additionalParameters.hashCode ^
      size.hashCode ^
      isDeleted.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      id.hashCode;
  }
}
