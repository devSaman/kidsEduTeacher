import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';

class CoursesModel extends ResponseData {
  CourseModel data;
  String message;
  CoursesModel({
    required this.data,
    required this.message,
  });

  CoursesModel copyWith({
    CourseModel? data,
    String? message,
  }) {
    return CoursesModel(
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': data.toMap()});
    result.addAll({'message': message});

    return result;
  }

  factory CoursesModel.fromMap(Map<String, dynamic> map) {
    return CoursesModel(
      data: CourseModel.fromMap(map['data']),
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoursesModel.fromJson(String source) =>
      CoursesModel.fromMap(json.decode(source));

  @override
  String toString() => 'CoursesModel(data: $data, message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoursesModel &&
        other.data == data &&
        other.message == message;
  }

  @override
  int get hashCode => data.hashCode ^ message.hashCode;
}

class CourseModel {
  int code;
  String message;
  List<Course> data;
  CourseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  CourseModel copyWith({
    int? code,
    String? message,
    List<Course>? data,
  }) {
    return CourseModel(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'message': message});
    result.addAll({'data': data.map((x) => x.toMap()).toList()});

    return result;
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      code: map['code']?.toInt() ?? 0,
      message: map['message'] ?? '',
      data: List<Course>.from(map['data']?.map((x) => Course.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CourseModel(code: $code, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseModel &&
        other.code == code &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ data.hashCode;
}

class Course {
  String id;
  List<String> auditory;
  String name;
  VideoCoverModel cover;
  AuthorModel author;
  int recommendationAge;
  bool isDeleted;
  String createdAt;
  String updatedAt;
  List<Lesson> lessons;
  Course({
    required this.id,
    required this.auditory,
    required this.name,
    required this.cover,
    required this.author,
    required this.recommendationAge,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.lessons,
  });

  Course copyWith({
    String? id,
    List<String>? auditory,
    String? name,
    VideoCoverModel? cover,
    AuthorModel? author,
    int? recommendationAge,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    List<Lesson>? lessons,
  }) {
    return Course(
      id: id ?? this.id,
      auditory: auditory ?? this.auditory,
      name: name ?? this.name,
      cover: cover ?? this.cover,
      author: author ?? this.author,
      recommendationAge: recommendationAge ?? this.recommendationAge,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lessons: lessons ?? this.lessons,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'auditory': auditory});
    result.addAll({'name': name});
    result.addAll({'cover': cover.toMap()});
    result.addAll({'author': author.toMap()});
    result.addAll({'recommendationAge': recommendationAge});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});
    result.addAll({'lessons': lessons.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] ?? '',
      auditory: List<String>.from(map['auditory']),
      name: map['name'] ?? '',
      cover: VideoCoverModel.fromMap(map['cover']),
      author: AuthorModel.fromMap(map['author']),
      recommendationAge: map['recommendationAge']?.toInt() ?? 0,
      isDeleted: map['isDeleted'] ?? false,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      lessons: List<Lesson>.from(map['lessons']?.map((x) => Lesson.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(id: $id, auditory: $auditory, name: $name, cover: $cover, author: $author, recommendationAge: $recommendationAge, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.id == id &&
        listEquals(other.auditory, auditory) &&
        other.name == name &&
        other.cover == cover &&
        other.author == author &&
        other.recommendationAge == recommendationAge &&
        other.isDeleted == isDeleted &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        listEquals(other.lessons, lessons);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        auditory.hashCode ^
        name.hashCode ^
        cover.hashCode ^
        author.hashCode ^
        recommendationAge.hashCode ^
        isDeleted.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        lessons.hashCode;
  }
}

class Lesson {
  LessonContent lessonContent;
  String id;
  String name;
  List<String> auditory;
  VideoCoverModel cover;
  AuthorModel author;
  int recommendationAge;
  List<VideoCoverModel> slides;
  List<dynamic> games;
  bool isDeleted;
  Lesson({
    required this.lessonContent,
    required this.id,
    required this.name,
    required this.auditory,
    required this.cover,
    required this.author,
    required this.recommendationAge,
    required this.slides,
    required this.games,
    required this.isDeleted,
  });

  Lesson copyWith({
    LessonContent? lessonContent,
    String? id,
    String? name,
    List<String>? auditory,
    VideoCoverModel? cover,
    AuthorModel? author,
    int? recommendationAge,
    List<VideoCoverModel>? slides,
    List<dynamic>? games,
    bool? isDeleted,
  }) {
    return Lesson(
      lessonContent: lessonContent ?? this.lessonContent,
      id: id ?? this.id,
      name: name ?? this.name,
      auditory: auditory ?? this.auditory,
      cover: cover ?? this.cover,
      author: author ?? this.author,
      recommendationAge: recommendationAge ?? this.recommendationAge,
      slides: slides ?? this.slides,
      games: games ?? this.games,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'auditory': auditory});
    result.addAll({'cover': cover.toMap()});
    result.addAll({'lessonContent': lessonContent.toMap()});
    result.addAll({'author': author.toMap()});
    result.addAll({'recommendationAge': recommendationAge});
    result.addAll({'slides': slides.map((x) => x.toMap()).toList()});
    result.addAll({'games': games});
    result.addAll({'isDeleted': isDeleted});

    return result;
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      auditory: List<String>.from(map['auditory']),
      cover: VideoCoverModel.fromMap(map['cover']),
      author: AuthorModel.fromMap(map['author']),
      lessonContent: LessonContent.fromMap(map['lessonContent']),
      recommendationAge: map['recommendationAge']?.toInt() ?? 0,
      slides: List<VideoCoverModel>.from(
          map['slides']?.map((x) => VideoCoverModel.fromMap(x))),
      games: List<dynamic>.from(map['games']),
      isDeleted: map['isDeleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Lesson.fromJson(String source) => Lesson.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Lesson(LessonContent: $lessonContent, id: $id, name: $name, auditory: $auditory, cover: $cover, author: $author, recommendationAge: $recommendationAge, slides: $slides, games: $games, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lesson &&
        other.id == id &&
        other.name == name &&
        listEquals(other.auditory, auditory) &&
        other.cover == cover &&
        other.author == author &&
        other.lessonContent == lessonContent &&
        other.recommendationAge == recommendationAge &&
        listEquals(other.slides, slides) &&
        listEquals(other.games, games) &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        auditory.hashCode ^
        cover.hashCode ^
        lessonContent.hashCode ^
        author.hashCode ^
        recommendationAge.hashCode ^
        slides.hashCode ^
        games.hashCode ^
        isDeleted.hashCode;
  }
}

class LessonContent {
  String headerImage;
  List<Amodel> body;
  LessonContent({
    required this.headerImage,
    required this.body,
  });

  LessonContent copyWith({
    String? headerImage,
    List<Amodel>? body,
  }) {
    return LessonContent(
      headerImage: headerImage ?? this.headerImage,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'headerImage': headerImage});
    result.addAll({'body': body.map((x) => x.toMap()).toList()});

    return result;
  }

  factory LessonContent.fromMap(Map<String, dynamic> map) {
    return LessonContent(
      headerImage: map['headerImage'] ?? '',
      body: List<Amodel>.from(map['body']?.map((x) => Amodel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonContent.fromJson(String source) =>
      LessonContent.fromMap(json.decode(source));

  @override
  String toString() => 'LessonContent(headerImage: $headerImage, body: $body)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LessonContent &&
        other.headerImage == headerImage &&
        listEquals(other.body, body);
  }

  @override
  int get hashCode => headerImage.hashCode ^ body.hashCode;
}

class Amodel {
  int index;
  String text;
  bool bold;
  String id;
  Amodel({
    required this.index,
    required this.text,
    required this.bold,
    required this.id,
  });

  Amodel copyWith({
    int? index,
    String? text,
    bool? bold,
    String? id,
  }) {
    return Amodel(
      index: index ?? this.index,
      text: text ?? this.text,
      bold: bold ?? this.bold,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'index': index});
    result.addAll({'text': text});
    result.addAll({'bold': bold});
    result.addAll({'id': id});

    return result;
  }

  factory Amodel.fromMap(Map<String, dynamic> map) {
    return Amodel(
      index: map['index']?.toInt() ?? 0,
      text: map['text'] ?? '',
      bold: map['bold'] ?? false,
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Amodel.fromJson(String source) => Amodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Amodel(index: $index, text: $text, bold: $bold, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Amodel &&
        other.index == index &&
        other.text == text &&
        other.bold == bold &&
        other.id == id;
  }

  @override
  int get hashCode {
    return index.hashCode ^ text.hashCode ^ bold.hashCode ^ id.hashCode;
  }
}

class AuthorModel {
  String id;
  String fullName;
  String phoneNumber;
  String birthDate;
  String createdAt;
  String updatedAt;
  bool isDeleted;
  AuthorModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
  });

  AuthorModel copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? birthDate,
    String? createdAt,
    String? updatedAt,
    bool? isDeleted,
  }) {
    return AuthorModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'fullName': fullName});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'birthDate': birthDate});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});
    result.addAll({'isDeleted': isDeleted});

    return result;
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      birthDate: map['birthDate'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      isDeleted: map['isDeleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthorModel(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, birthDate: $birthDate, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthorModel &&
        other.id == id &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.birthDate == birthDate &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        phoneNumber.hashCode ^
        birthDate.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        isDeleted.hashCode;
  }
}
