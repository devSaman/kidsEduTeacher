import 'dart:convert';

import 'package:kids_edu_teacher/data/responses/response_data.dart';

class VerificationModel extends ResponseData {
  String? message;
  UserData? data;
  VerificationModel({
    this.message,
    this.data,
  });


  VerificationModel copyWith({
    String? message,
    UserData? data,
  }) {
    return VerificationModel(
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

  factory VerificationModel.fromMap(Map<String, dynamic> map) {
    return VerificationModel(
      message: map['message'],
      data: map['data'] != null ? UserData.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerificationModel.fromJson(String source) => VerificationModel.fromMap(json.decode(source));

  @override
  String toString() => 'VerificationModel(message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is VerificationModel &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class UserData {
  String? userId;
  UserData({
    this.userId,
  });

  UserData copyWith({
    String? userId,
  }) {
    return UserData(
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

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source));

  @override
  String toString() => 'UserData(userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserData &&
      other.userId == userId;
  }

  @override
  int get hashCode => userId.hashCode;
}
