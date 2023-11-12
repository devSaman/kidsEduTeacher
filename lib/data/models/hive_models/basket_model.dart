import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class BasketModel extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String attribute;
  @HiveField(3)
  late String attributeValue;
  @HiveField(4)
  late String price;
  @HiveField(5)
  late String image;
}
