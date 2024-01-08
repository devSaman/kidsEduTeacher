import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kids_edu_teacher/data/responses/response_data.dart';

class BannersModel extends ResponseData {
  String? message;
  List<BannerModel>? data;
  BannersModel({
    this.message,
    this.data,
  });

  factory BannersModel.fromMap(Map<String, dynamic> map) {
    return BannersModel(
      message: map['message'],
      data: map['data'] != null
          ? List<BannerModel>.from(
              map['data']?.map((x) => BannerModel.fromMap(x)))
          : null,
    );
  }

  factory BannersModel.fromJson(String source) =>
      BannersModel.fromMap(json.decode(source));
}

class BannerModel {
  String? id;
  String? title;
  List<String>? images;
  String? adminPhoneNumber;
  String? description;
  String? url;
  BannerModel({
    this.id,
    this.title,
    this.images,
    this.adminPhoneNumber,
    this.description,
    this.url,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'],
      title: map['title'],
      images: List<String>.from(map['images']),
      adminPhoneNumber: map['adminPhoneNumber'],
      description: map['description'],
      url: map['url'],
    );
  }

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source));
}
