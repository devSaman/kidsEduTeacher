import 'dart:convert';

import 'package:kids_edu_teacher/data/responses/response_data.dart';

class CreateCardModel extends ResponseData {
  num? code;
  String? msg;
  CardDataModel? data;
  CreateCardModel({
    this.code,
    this.msg,
    this.data,
  });

  CreateCardModel copyWith({
    num? code,
    String? msg,
    CardDataModel? data,
  }) {
    return CreateCardModel(
      code: code ?? this.code,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (code != null) {
      result.addAll({'code': code});
    }
    if (msg != null) {
      result.addAll({'msg': msg});
    }
    if (data != null) {
      result.addAll({'data': data!.toMap()});
    }

    return result;
  }

  factory CreateCardModel.fromMap(Map<String, dynamic> map) {
    return CreateCardModel(
      code: map['code'],
      msg: map['msg'],
      data: map['data'] != null ? CardDataModel.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateCardModel.fromJson(String source) =>
      CreateCardModel.fromMap(json.decode(source));

  @override
  String toString() => 'CreateCardModel(code: $code, msg: $msg, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateCardModel &&
        other.code == code &&
        other.msg == msg &&
        other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ msg.hashCode ^ data.hashCode;
}

class CardDataModel {
  String? jsonrpc;
  num? id;
  DataResult? resultt;
  CardDataModel({
    this.jsonrpc,
    this.id,
    this.resultt,
  });
 


  CardDataModel copyWith({
    String? jsonrpc,
    num? id,
    DataResult? resultt,
  }) {
    return CardDataModel(
      jsonrpc: jsonrpc ?? this.jsonrpc,
      id: id ?? this.id,
      resultt: resultt ?? this.resultt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(jsonrpc != null){
      result.addAll({'jsonrpc': jsonrpc});
    }
    if(id != null){
      result.addAll({'id': id});
    }
    if(resultt != null){
      result.addAll({'result': resultt!.toMap()});
    }
  
    return result;
  }

  factory CardDataModel.fromMap(Map<String, dynamic> map) {
    return CardDataModel(
      jsonrpc: map['jsonrpc'],
      id: map['id'],
      resultt: map['result'] != null ? DataResult.fromMap(map['result']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardDataModel.fromJson(String source) => CardDataModel.fromMap(json.decode(source));

  @override
  String toString() => 'CardDataModel(jsonrpc: $jsonrpc, id: $id, result: $resultt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CardDataModel &&
      other.jsonrpc == jsonrpc &&
      other.id == id &&
      other.resultt == resultt;
  }

  @override
  int get hashCode => jsonrpc.hashCode ^ id.hashCode ^ resultt.hashCode;
}

class DataResult {
  bool? sent;
  String? phone;
  num? wait;
  DataResult({
    this.sent,
    this.phone,
    this.wait,
  });
 

  DataResult copyWith({
    bool? sent,
    String? phone,
    num? wait,
  }) {
    return DataResult(
      sent: sent ?? this.sent,
      phone: phone ?? this.phone,
      wait: wait ?? this.wait,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(sent != null){
      result.addAll({'sent': sent});
    }
    if(phone != null){
      result.addAll({'phone': phone});
    }
    if(wait != null){
      result.addAll({'wait': wait});
    }
  
    return result;
  }

  factory DataResult.fromMap(Map<String, dynamic> map) {
    return DataResult(
      sent: map['sent'],
      phone: map['phone'],
      wait: map['wait'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataResult.fromJson(String source) => DataResult.fromMap(json.decode(source));

  @override
  String toString() => 'DataResult(sent: $sent, phone: $phone, wait: $wait)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DataResult &&
      other.sent == sent &&
      other.phone == phone &&
      other.wait == wait;
  }

  @override
  int get hashCode => sent.hashCode ^ phone.hashCode ^ wait.hashCode;
}
