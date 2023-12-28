import 'package:hive_flutter/adapters.dart';
part 'hive_favourite_model.g.dart';

@HiveType(typeId: 1)
class HiveFavouriteModel extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String type;
}
