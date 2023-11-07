import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:kids_edu_teacher/data/responses/response_data.dart';

class ShopMainModel extends ResponseData {
  String? message;
  List<ShopMaincategories> data;
  ShopMainModel({
    this.message,
    required this.data,
  });

  ShopMainModel copyWith({
    String? message,
    List<ShopMaincategories>? data,
  }) {
    return ShopMainModel(
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (message != null) {
      result.addAll({'message': message});
    }
    result.addAll({'data': data.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ShopMainModel.fromMap(Map<String, dynamic> map) {
    return ShopMainModel(
      message: map['message'],
      data: List<ShopMaincategories>.from(
          map['data']?.map((x) => ShopMaincategories.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopMainModel.fromJson(String source) =>
      ShopMainModel.fromMap(json.decode(source));

  @override
  String toString() => 'ShopMainModel(message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopMainModel &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode;
}

class ShopMaincategories {
  String id;
  String? name;
  String image;
  bool isDeleted;
  List<ChildCategory> childCategories;
  List<ProductModel> products;
  ShopMaincategories({
    required this.id,
    this.name,
    required this.image,
    required this.isDeleted,
    required this.childCategories,
    required this.products,
  });

  ShopMaincategories copyWith({
    String? id,
    String? name,
    String? image,
    bool? isDeleted,
    List<ChildCategory>? childCategories,
    List<ProductModel>? products,
  }) {
    return ShopMaincategories(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      isDeleted: isDeleted ?? this.isDeleted,
      childCategories: childCategories ?? this.childCategories,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    if (name != null) {
      result.addAll({'name': name});
    }
    result.addAll({'image': image});
    result.addAll({'isDeleted': isDeleted});
    result.addAll(
        {'childCategories': childCategories.map((x) => x.toMap()).toList()});
    result.addAll({'products': products.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ShopMaincategories.fromMap(Map<String, dynamic> map) {
    return ShopMaincategories(
      id: map['id'] ?? '',
      name: map['name'],
      image: map['image'] ?? '',
      isDeleted: map['isDeleted'] ?? false,
      childCategories: List<ChildCategory>.from(
          map['childCategories']?.map((x) => ChildCategory.fromMap(x))),
      products: List<ProductModel>.from(
          map['products']?.map((x) => ProductModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopMaincategories.fromJson(String source) =>
      ShopMaincategories.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShopMaincategories(id: $id, name: $name, image: $image, isDeleted: $isDeleted, childCategories: $childCategories, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShopMaincategories &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.isDeleted == isDeleted &&
        listEquals(other.childCategories, childCategories) &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        isDeleted.hashCode ^
        childCategories.hashCode ^
        products.hashCode;
  }
}

class ChildCategory {
  String id;
  String name;
  String image;
  String parentCategory;
  List<String> auditory;
  bool isDeleted;
  List<ProductModel> products;
  ChildCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.parentCategory,
    required this.auditory,
    required this.isDeleted,
    required this.products,
  });

  ChildCategory copyWith({
    String? id,
    String? name,
    String? image,
    String? parentCategory,
    List<String>? auditory,
    bool? isDeleted,
    List<ProductModel>? products,
  }) {
    return ChildCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      parentCategory: parentCategory ?? this.parentCategory,
      auditory: auditory ?? this.auditory,
      isDeleted: isDeleted ?? this.isDeleted,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'parentCategory': parentCategory});
    result.addAll({'auditory': auditory});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'products': products.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ChildCategory.fromMap(Map<String, dynamic> map) {
    return ChildCategory(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      parentCategory: map['parentCategory'] ?? '',
      auditory: List<String>.from(map['auditory']),
      isDeleted: map['isDeleted'] ?? false,
      products: List<ProductModel>.from(
          map['products']?.map((x) => ProductModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildCategory.fromJson(String source) =>
      ChildCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChildCategory(id: $id, name: $name, image: $image, parentCategory: $parentCategory, auditory: $auditory, isDeleted: $isDeleted, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildCategory &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.parentCategory == parentCategory &&
        listEquals(other.auditory, auditory) &&
        other.isDeleted == isDeleted &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        parentCategory.hashCode ^
        auditory.hashCode ^
        isDeleted.hashCode ^
        products.hashCode;
  }
}

class ProductModel {
  String id;
  List<String> images;
  String name;
  String description;
  dynamic price;
  String conditions;
  bool isDeleted;
  List<Attribute> attributes;
  ProductModel({
    required this.id,
    required this.images,
    required this.name,
    required this.description,
    required this.price,
    required this.conditions,
    required this.isDeleted,
    required this.attributes,
  });

  ProductModel copyWith({
    String? id,
    List<String>? images,
    String? name,
    String? description,
    dynamic price,
    String? conditions,
    bool? isDeleted,
    List<Attribute>? attributes,
  }) {
    return ProductModel(
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      conditions: conditions ?? this.conditions,
      isDeleted: isDeleted ?? this.isDeleted,
      attributes: attributes ?? this.attributes,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'images': images});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'price': price});
    result.addAll({'conditions': conditions});
    result.addAll({'isDeleted': isDeleted});
    result.addAll({'attributes': attributes.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      images: List<String>.from(map['images']),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? null,
      conditions: map['conditions'] ?? '',
      isDeleted: map['isDeleted'] ?? false,
      attributes: List<Attribute>.from(
          map['attributes']?.map((x) => Attribute.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, images: $images, name: $name, description: $description, price: $price, conditions: $conditions, isDeleted: $isDeleted, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        listEquals(other.images, images) &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.conditions == conditions &&
        other.isDeleted == isDeleted &&
        listEquals(other.attributes, attributes);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        images.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        conditions.hashCode ^
        isDeleted.hashCode ^
        attributes.hashCode;
  }
}

class Attribute {
  String id;
  String name;
  List<String> items;
  Attribute({
    required this.id,
    required this.name,
    required this.items,
  });

  Attribute copyWith({
    String? id,
    String? name,
    List<String>? items,
  }) {
    return Attribute(
      id: id ?? this.id,
      name: name ?? this.name,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'items': items});

    return result;
  }

  factory Attribute.fromMap(Map<String, dynamic> map) {
    return Attribute(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      items: List<String>.from(map['items']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Attribute.fromJson(String source) =>
      Attribute.fromMap(json.decode(source));

  @override
  String toString() => 'Attribute(id: $id, name: $name, items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Attribute &&
        other.id == id &&
        other.name == name &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ items.hashCode;
}
