import 'dart:convert';

import 'package:kids_edu_teacher/data/responses/response_data.dart';

class ErrorModel extends ResponseData {
  final String? message;
  final String? msg;
  final dynamic data;
  ErrorModel({
    this.message,
    this.msg,
    required this.data,
  });

  ErrorModel copyWith({
    String? message,
    String? msg,
    dynamic data,
  }) {
    return ErrorModel(
      message: message ?? this.message,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (message != null) {
      result.addAll({'message': message});
    }
    if (msg != null) {
      result.addAll({'msg': msg});
    }
    result.addAll({'data': data});

    return result;
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      message: map['message'],
      msg: map['msg'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source));

  @override
  String toString() => 'ErrorModel(message: $message, msg: $msg, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorModel &&
        other.message == message &&
        other.msg == msg &&
        other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ msg.hashCode ^ data.hashCode;
}
