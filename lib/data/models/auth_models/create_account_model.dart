import 'dart:convert';

import 'package:kids_edu_teacher/data/responses/response_data.dart';

class CretaedAccountModel extends ResponseData {
  final String? message;
  final dynamic data;
  CretaedAccountModel({
    this.message,
    required this.data,
  });

  CretaedAccountModel copyWith({
    String? message,
    dynamic data,
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
    result.addAll({'data': data});
  
    return result;
  }

  factory CretaedAccountModel.fromMap(Map<String, dynamic> map) {
    return CretaedAccountModel(
      message: map['message'],
      data: map['data'],
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
