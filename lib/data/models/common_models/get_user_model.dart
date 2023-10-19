import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';

class UserModel extends ResponseData {
  String? message;
  UserData data;
  UserModel({
    this.message,
    required this.data,
  });

  UserModel copyWith({
    String? message,
    UserData? data,
  }) {
    return UserModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (message != null) {
      result.addAll({'message': message});
    }
    result.addAll({'data': data.toMap()});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      message: map['message'],
      data: UserData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.message == message && other.data == data;
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class UserData {
  num? balance;
  String? id;
  String? fullName;
  String? phoneNumber;
  String? birthDate;
  bool? isDeleted;
  List<UserCardsModel>? cards;
  List<VideoModel>? favoritedVidoes;
  List<VideoModel>? favoritedDocuments;
  UserData({
    this.balance,
    this.id,
    this.fullName,
    this.phoneNumber,
    this.birthDate,
    this.isDeleted,
    this.cards,
    this.favoritedVidoes,
    this.favoritedDocuments,
  });

  UserData copyWith({
    num? balance,
    String? id,
    String? fullName,
    String? phoneNumber,
    String? birthDate,
    bool? isDeleted,
    List<UserCardsModel>? cards,
    List<VideoModel>? favoritedVidoes,
    List<VideoModel>? favoritedDocuments,
  }) {
    return UserData(
      balance: balance ?? this.balance,
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
      isDeleted: isDeleted ?? this.isDeleted,
      cards: cards ?? this.cards,
      favoritedVidoes: favoritedVidoes ?? this.favoritedVidoes,
      favoritedDocuments: favoritedDocuments ?? this.favoritedDocuments,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (balance != null) {
      result.addAll({'balance': balance});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (fullName != null) {
      result.addAll({'fullName': fullName});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (birthDate != null) {
      result.addAll({'birthDate': birthDate});
    }
    if (isDeleted != null) {
      result.addAll({'isDeleted': isDeleted});
    }
    if (cards != null) {
      result.addAll({'cards': cards!.map((x) => x.toMap()).toList()});
    }
    if (favoritedVidoes != null) {
      result.addAll(
          {'favoritedVidoes': favoritedVidoes!.map((x) => x.toMap()).toList()});
    }
    if (favoritedDocuments != null) {
      result.addAll({
        'favoritedDocuments': favoritedDocuments!.map((x) => x.toMap()).toList()
      });
    }

    return result;
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      balance: map['balance'],
      id: map['id'],
      fullName: map['fullName'],
      phoneNumber: map['phoneNumber'],
      birthDate: map['birthDate'],
      isDeleted: map['isDeleted'],
      cards: map['cards'] != null
          ? List<UserCardsModel>.from(
              map['cards']?.map((x) => UserCardsModel.fromMap(x)))
          : null,
      favoritedVidoes: map['favoritedVidoes'] != null
          ? List<VideoModel>.from(
              map['favoritedVidoes']?.map((x) => VideoModel.fromMap(x)))
          : null,
      favoritedDocuments: map['favoritedDocuments'] != null
          ? List<VideoModel>.from(
              map['favoritedDocuments']?.map((x) => VideoModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(balance: $balance, id: $id, fullName: $fullName, phoneNumber: $phoneNumber, birthDate: $birthDate, isDeleted: $isDeleted, cards: $cards, favoritedVidoes: $favoritedVidoes, favoritedDocuments: $favoritedDocuments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.balance == balance &&
        other.id == id &&
        other.fullName == fullName &&
        other.phoneNumber == phoneNumber &&
        other.birthDate == birthDate &&
        other.isDeleted == isDeleted &&
        listEquals(other.cards, cards) &&
        listEquals(other.favoritedVidoes, favoritedVidoes) &&
        listEquals(other.favoritedDocuments, favoritedDocuments);
  }

  @override
  int get hashCode {
    return balance.hashCode ^
        id.hashCode ^
        fullName.hashCode ^
        phoneNumber.hashCode ^
        birthDate.hashCode ^
        isDeleted.hashCode ^
        cards.hashCode ^
        favoritedVidoes.hashCode ^
        favoritedDocuments.hashCode;
  }
}

class UserCardsModel {
  String? name;
  String? number;
  String? expiration;
  String? type;
  String? bank;
  bool? isVerified;
  bool? isMain;
  String? id;
  UserCardsModel({
    this.name,
    this.number,
    this.expiration,
    this.type,
    this.bank,
    this.isVerified,
    this.isMain,
    this.id,
  });

  UserCardsModel copyWith({
    String? name,
    String? number,
    String? expiration,
    String? type,
    String? bank,
    bool? isVerified,
    bool? isMain,
    String? id,
  }) {
    return UserCardsModel(
      name: name ?? this.name,
      number: number ?? this.number,
      expiration: expiration ?? this.expiration,
      type: type ?? this.type,
      bank: bank ?? this.bank,
      isVerified: isVerified ?? this.isVerified,
      isMain: isMain ?? this.isMain,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (number != null) {
      result.addAll({'number': number});
    }
    if (expiration != null) {
      result.addAll({'expiration': expiration});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    if (bank != null) {
      result.addAll({'bank': bank});
    }
    if (isVerified != null) {
      result.addAll({'isVerified': isVerified});
    }
    if (isMain != null) {
      result.addAll({'isMain': isMain});
    }
    if (id != null) {
      result.addAll({'id': id});
    }

    return result;
  }

  factory UserCardsModel.fromMap(Map<String, dynamic> map) {
    return UserCardsModel(
      name: map['name'],
      number: map['number'],
      expiration: map['expiration'],
      type: map['type'],
      bank: map['bank'],
      isVerified: map['isVerified'],
      isMain: map['isMain'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCardsModel.fromJson(String source) =>
      UserCardsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserCardsModel(name: $name, number: $number, expiration: $expiration, type: $type, bank: $bank, isVerified: $isVerified, isMain: $isMain, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserCardsModel &&
        other.name == name &&
        other.number == number &&
        other.expiration == expiration &&
        other.type == type &&
        other.bank == bank &&
        other.isVerified == isVerified &&
        other.isMain == isMain &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        number.hashCode ^
        expiration.hashCode ^
        type.hashCode ^
        bank.hashCode ^
        isVerified.hashCode ^
        isMain.hashCode ^
        id.hashCode;
  }
}
