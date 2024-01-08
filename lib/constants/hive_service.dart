import 'package:hive_flutter/adapters.dart';
import 'package:kids_edu_teacher/data/models/hive_models/hive_favourite_model.dart';
import 'package:kids_edu_teacher/data/repositories/main_repository.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';

class HiveService {
  static bool isItemInHive(String itemId) {
    final savedItemList =
        Hive.box<HiveFavouriteModel>('favourites').values.toList();
    var item;
    for (var prod in savedItemList) {
      if (prod.id == itemId) {
        // print("PROD ID ${prod.id}");
        // print("ITEM ID $itemId");
        item = prod;
      }
    }

     print(item != null);
    return item != null;
  }

  static void deleteProduct(String id, String type) {
    final box = Hive.box<HiveFavouriteModel>('favourites').values.toList();
    final itemList = Hive.box<HiveFavouriteModel>('favourites');
    for (var item in box) {
      if (id == item.id) {
        type == "video"
            ? MainRepository.removeVideoFavourites(item.id).then(
                (response) {
                  if (response is SuccessfulResponse) {
                    print("HERE SAVED PRODUCT IS DELETE FUCNTION IS WORKING");
                    itemList.delete(item.key);
                  } else {
                    print(response.toString());
                  }
                },
              )
            : MainRepository.removeDocumentFavourites(item.id).then(
                (response) {
                  if (response is SuccessfulResponse) {
                    print("HERE SAVED PRODUCT IS DELETE FUCNTION IS WORKING");
                    itemList.delete(item.key);
                  } else {
                    print(response.toString());
                  }
                },
              );
        break;
      }
    }
  }

  static void addToBox(String id, String type) {
    final product = HiveFavouriteModel()
      ..id = id
      ..type = type;
    final box = Hive.box<HiveFavouriteModel>('favourites');
    type == "video"
        ? MainRepository.addVideoFavourites(product.id).then(
            (response) {
              if (response is SuccessfulResponse) {
                print("HERE SAVED PRODUCT IS ADD FUCNTION IS WORKING");
                box.add(product);
              } else {
                print(response.toString());
              }
            },
          )
        : MainRepository.addDocumentFavourites(product.id).then(
            (response) {
              if (response is SuccessfulResponse) {
                print("HERE SAVED PRODUCT IS ADD FUCNTION IS WORKING");
                box.add(product);
              } else {
                print(response.toString());
              }
            },
          );
  }
}
