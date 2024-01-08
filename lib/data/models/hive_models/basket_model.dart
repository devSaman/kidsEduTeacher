import 'package:hive_flutter/adapters.dart';
part 'basket_model.g.dart';

@HiveType(typeId: 0)
class BasketModel extends HiveObject {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic name;
  @HiveField(2)
  dynamic attribute;
  @HiveField(3)
  dynamic attributeValue;
  @HiveField(4)
  dynamic price;
  @HiveField(5)
  dynamic image;
  @HiveField(6)
  dynamic qty;
}
