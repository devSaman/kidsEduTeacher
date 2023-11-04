import 'dart:convert';

import 'package:kids_edu_teacher/data/responses/response_data.dart';

class CretaedAccountModel extends ResponseData {
  final String? message;
  final CreatedUserData? data;
  CretaedAccountModel({
    this.message,
    this.data,
  });
  

  CretaedAccountModel copyWith({
    String? message,
    CreatedUserData? data,
  }) {
    return CretaedAccountModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(message != null){
      result.addAll({'message': message});
    }
    if(data != null){
      result.addAll({'data': data!.toMap()});
    }
  
    return result;
  }

  factory CretaedAccountModel.fromMap(Map<String, dynamic> map) {
    return CretaedAccountModel(
      message: map['message'],
      data: map['data'] != null ? CreatedUserData.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CretaedAccountModel.fromJson(String source) => CretaedAccountModel.fromMap(json.decode(source));

  @override
  String toString() => 'CretaedAccountModel(message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CretaedAccountModel &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class CreatedUserData {
  String? userId;
  CreatedUserData({
    this.userId,
  });

  CreatedUserData copyWith({
    String? userId,
  }) {
    return CreatedUserData(
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(userId != null){
      result.addAll({'userId': userId});
    }
  
    return result;
  }

  factory CreatedUserData.fromMap(Map<String, dynamic> map) {
    return CreatedUserData(
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatedUserData.fromJson(String source) => CreatedUserData.fromMap(json.decode(source));

  @override
  String toString() => 'CreatedUserData(userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CreatedUserData &&
      other.userId == userId;
  }

  @override
  int get hashCode => userId.hashCode;
}
