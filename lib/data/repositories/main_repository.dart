import 'dart:convert';
import 'dart:io';

import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/data/models/auth_models/create_account_model.dart';
import 'package:kids_edu_teacher/data/models/auth_models/vaerification_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/get_user_model.dart';
import 'package:kids_edu_teacher/data/models/payment_card_models/card_create_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/banner_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/main_model.dart';
import 'package:kids_edu_teacher/data/models/shop_models/make_order_model.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/data/responses/error_response.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';
import 'package:http/http.dart' as http;
import 'package:kids_edu_teacher/data/responses/status_codes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/common_models/courses_model.dart';

class MainRepository {
  MainRepository._();

  static Future<ResponseData> createAccount(
      String name, String psw, String phone, String dtf) async {
    // try {
    final response = await http.post(Uri.parse('${ApiPaths.basicUrl}/teachers'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "fullName": name,
            "birthDate": dtf,
            "phoneNumber": "998$phone",
            "password": name
          },
        ));
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return CretaedAccountModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> verification(
      String phone, String code, bool fromCreate) async {
    try {
      final response = fromCreate
          ? await http.post(Uri.parse('${ApiPaths.basicUrl}/teachers/verify'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode(
                {"phoneNumber": "998$phone".replaceAll("-", ""), "code": code},
              ))
          : await http.post(
              Uri.parse('${ApiPaths.basicUrl}/teachers/verify-reset-code'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode(
                {"phoneNumber": "998$phone".replaceAll("-", ""), "code": code},
              ));
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return VerificationModel.fromJson(response.body);
        case StatusCodes.alreadyTaken:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> login(String phone, String psw) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/teachers/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "phoneNumber": "998$phone".replaceAll("-", ""),
            "password": psw,
          },
        ),
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return CretaedAccountModel.fromJson(response.body);
        case StatusCodes.alreadyTaken:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> changePsw(String phone, String psw) async {
    try {
      final response = await http.post(
          Uri.parse('${ApiPaths.basicUrl}/teachers/update-password'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(
            {"phoneNumber": "998$phone".replaceAll("-", ""), "password": psw},
          ));
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return CretaedAccountModel.fromJson(response.body);
        case StatusCodes.alreadyTaken:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> forgotPassword(String phone) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/teachers/reset-password'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {"phoneNumber": "998$phone".replaceAll("-", "")},
        ),
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return CretaedAccountModel.fromJson(response.body);
        case StatusCodes.alreadyTaken:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> getVideoCollections() async {
    String fileName = "videoCollectionsCache.json";
    var cacheDir = await getTemporaryDirectory();
    if (await File("${cacheDir.path}/$fileName").exists()) {
      print("Loading from cache");
      var jsonData = File("${cacheDir.path}/$fileName").readAsStringSync();
      VideoCollectionsModel response = VideoCollectionsModel.fromJson(jsonData);
      return response;
    } else {
      try {
        final response = await http.get(
          Uri.parse('${ApiPaths.basicUrl}/teachers/video-collections'),
          headers: {'Content-Type': 'application/json'},
        );
        print(response.body);
        switch (response.statusCode) {
          case StatusCodes.ok:
            var tempDir = await getTemporaryDirectory();
            File file = File("${tempDir.path}/$fileName");
            if (!await file.exists()) {
              file.createSync(recursive: true);
            }
            file.writeAsString(response.body,
                flush: true, mode: FileMode.write);
            return VideoCollectionsModel.fromJson(response.body);
          case StatusCodes.alreadyTaken:
            return ErrorModel.fromJson(response.body);
          default:
            throw ErrorModel.fromJson(response.body);
        }
      } catch (e) {
        return ResponseError.noInternet;
      }
    }
  }

  static Future<ResponseData> getDocumentCollections() async {
    String fileName = "documentCollectionsCache.json";
    var cacheDir = await getTemporaryDirectory();
    if (await File("${cacheDir.path}/$fileName").exists()) {
      print("Loading from cache");
      var jsonData = File("${cacheDir.path}/$fileName").readAsStringSync();
      VideoCollectionsModel response = VideoCollectionsModel.fromJson(jsonData);
      return response;
    } else {
      try {
        final response = await http.get(
          Uri.parse('${ApiPaths.basicUrl}/teachers/document-collections'),
          headers: {'Content-Type': 'application/json'},
        );
        print(response.body);
        switch (response.statusCode) {
          case StatusCodes.ok:
            var tempDir = await getTemporaryDirectory();
            File file = File("${tempDir.path}/$fileName");
            if (!await file.exists()) {
              file.createSync(recursive: true);
            }
            file.writeAsString(response.body,
                flush: true, mode: FileMode.write);
            return VideoCollectionsModel.fromJson(response.body);
          case StatusCodes.alreadyTaken:
            return ErrorModel.fromJson(response.body);
          default:
            throw ErrorModel.fromJson(response.body);
        }
      } catch (e) {
        return ResponseError.noInternet;
      }
    }
  }

  static Future<ResponseData> allCourses() async {
    String fileName = "allCoursesCache.json";
    var cacheDir = await getTemporaryDirectory();
    if (await File("${cacheDir.path}/$fileName").exists()) {
      print("Loading from cache");
      var jsonData = File("${cacheDir.path}/$fileName").readAsStringSync();
      CoursesModel response = CoursesModel.fromJson(jsonData);
      return response;
    } else {
      try {
        final response = await http.get(
          Uri.parse('${ApiPaths.basicUrl}/teachers/courses'),
          headers: {'Content-Type': 'application/json'},
        );
        print(response.body);
        switch (response.statusCode) {
          case StatusCodes.ok:
            var tempDir = await getTemporaryDirectory();
            File file = File("${tempDir.path}/$fileName");
            if (!await file.exists()) {
              file.createSync(recursive: true);
            }
            file.writeAsString(response.body,
                flush: true, mode: FileMode.write);
            return CoursesModel.fromJson(response.body);
          case StatusCodes.alreadyTaken:
            return ErrorModel.fromJson(response.body);
          default:
            throw ErrorModel.fromJson(response.body);
        }
      } catch (e) {
        return ResponseError.noInternet;
      }
    }
  }

  static Future<ResponseData> getUserData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId = _prefs.getString('userId');
    String fileName = "userDataCache.json";
    print(userId);
    var cacheDir = await getTemporaryDirectory();
    if (await File("${cacheDir.path}/$fileName").exists()) {
      print("Loading from cache");
      var jsonData = File("${cacheDir.path}/$fileName").readAsStringSync();
      UserModel response = UserModel.fromJson(jsonData);
      return response;
    } else {
      try {
        final response = await http.post(
            Uri.parse('${ApiPaths.basicUrl}/teachers/getMe'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({"teacherId": userId}));
        print(response.body);
        switch (response.statusCode) {
          case StatusCodes.ok:
            var tempDir = await getTemporaryDirectory();
            File file = File("${tempDir.path}/$fileName");
            if (!await file.exists()) {
              file.createSync(recursive: true);
            }
            file.writeAsString(response.body,
                flush: true, mode: FileMode.write);
            return UserModel.fromJson(response.body);
          case StatusCodes.alreadyTaken:
            return ErrorModel.fromJson(response.body);
          default:
            throw ErrorModel.fromJson(response.body);
        }
      } catch (e) {
        return ResponseError.noInternet;
      }
    }
  }

  static Future<ResponseData> addCard(
      String name, String number, String date, bool isMain) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId = _prefs.getString('userId');
    try {
      final response =
          await http.post(Uri.parse('${ApiPaths.basicUrl}/teachers/cards'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode({
                "teacherId": userId,
                "name": name,
                "number": number.replaceAll(" ", ""),
                "expiration": date.replaceAll("/", ""),
                "isMain": isMain
              }));
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return CreateCardModel.fromJson(response.body);
        case StatusCodes.alreadyTaken:
        case StatusCodes.badRequest:
        case StatusCodes.unathorized:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> confirmCard(String number, String code) async {
    try {
      print(number);
      print(code);
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/teachers/cards/verify'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "cardNumber": number.replaceAll(" ", ""),
            "code": code,
          },
        ),
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
        case StatusCodes.badRequest:
        case StatusCodes.unathorized:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> getShopData() async {
    String fileName = "shopDataCache.json";
    var cacheDir = await getTemporaryDirectory();
    if (await File("${cacheDir.path}/$fileName").exists()) {
      print("Loading from cache");
      var jsonData = File("${cacheDir.path}/$fileName").readAsStringSync();
      ShopMainModel response = ShopMainModel.fromJson(jsonData);
      return response;
    } else {
      try {
        final response = await http.get(
          Uri.parse('${ApiPaths.basicUrl}/categories'),
          headers: {'Content-Type': 'application/json'},
        );
        print(response.body);
        switch (response.statusCode) {
          case StatusCodes.ok:
            var tempDir = await getTemporaryDirectory();
            File file = File("${tempDir.path}/$fileName");
            if (!await file.exists()) {
              file.createSync(recursive: true);
            }
            file.writeAsString(response.body,
                flush: true, mode: FileMode.write);
            return ShopMainModel.fromJson(response.body);
          case StatusCodes.alreadyTaken:
          case StatusCodes.badRequest:
          case StatusCodes.unathorized:
            return ErrorModel.fromJson(response.body);
          default:
            throw ErrorModel.fromJson(response.body);
        }
      } catch (e) {
        return ResponseError.noInternet;
      }
    }
  }

  static Future<ResponseData> getAllBanners() async {
    String fileName = "bannersDataCache.json";
    var cacheDir = await getTemporaryDirectory();
    if (await File("${cacheDir.path}/$fileName").exists()) {
      print("Loading from cache");
      var jsonData = File("${cacheDir.path}/$fileName").readAsStringSync();
      BannersModel response = BannersModel.fromJson(jsonData);
      return response;
    } else {
      // try {
        final response = await http.get(
          Uri.parse('${ApiPaths.basicUrl}/banners'),
          headers: {'Content-Type': 'application/json'},
        );
        print(response.body);
        switch (response.statusCode) {
          case StatusCodes.ok:
            var tempDir = await getTemporaryDirectory();
            File file = File("${tempDir.path}/$fileName");
            if (!await file.exists()) {
              file.createSync(recursive: true);
            }
            file.writeAsString(response.body,
                flush: true, mode: FileMode.write);
            return BannersModel.fromJson(response.body);
          case StatusCodes.alreadyTaken:
          case StatusCodes.badRequest:
          case StatusCodes.unathorized:
            return ErrorModel.fromJson(response.body);
          default:
            throw ErrorModel.fromJson(response.body);
        }
      // } catch (e) {
      //   return ResponseError.noInternet;
      // }
    }
  }

  static Future<ResponseData> topUpBalance(
      String teacherId, String cardNumber, int amount) async {
    try {
      print(teacherId);
      print(cardNumber);
      print(amount);
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/teachers/topUpBalance'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "teacherId": teacherId,
            "cardNumber": cardNumber,
            "amount": amount,
          },
        ),
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
        case StatusCodes.badRequest:
        case StatusCodes.unathorized:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> addVideoFavourites(String videoId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId = _prefs.getString('userId');
    try {
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/teachers/addFavouriteVideos'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "teacherId": userId,
            "videoIds": [videoId],
          },
        ),
      );
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
        case StatusCodes.badRequest:
        case StatusCodes.unathorized:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> removeVideoFavourites(String videoId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId = _prefs.getString('userId');
    try {
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/teachers/removeFavouriteVideos'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "teacherId": userId,
            "videoIds": [videoId],
          },
        ),
      );
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
        case StatusCodes.badRequest:
        case StatusCodes.unathorized:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> removeDocumentFavourites(String videoId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId = _prefs.getString('userId');
    try {
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/teachers/removeFavouriteDocuments'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "teacherId": userId,
            "documentIds": [videoId],
          },
        ),
      );
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
        case StatusCodes.badRequest:
        case StatusCodes.unathorized:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> addDocumentFavourites(String videoId) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId = _prefs.getString('userId');
    try {
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/teachers/addFavouriteDocuments'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "teacherId": userId,
            "documentIds": [videoId],
          },
        ),
      );
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
        case StatusCodes.badRequest:
        case StatusCodes.unathorized:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }

  static Future<ResponseData> makeOrder(MakeOrderModel order) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId = _prefs.getString('userId');
    var list = [];

    for (var i = 0; i < order.productIds.length; i++) {
      Map<String, dynamic> data = {
        "productId": order.productIds[i].productId,
        "count": order.productIds[i].count,
        "option": {
          order.productIds[i].optionName: order.productIds[i].optionValue
        }
      };
      list.add(data);
    }

    try {
      final response = await http.post(
        Uri.parse('${ApiPaths.basicUrl}/orders'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "teacherId": userId,
            "orderAmount": order.amount,
            "productIds": list
          },
        ),
      );
      // print(response.body);
      print(response.statusCode);
      switch (response.statusCode) {
        case StatusCodes.ok:
          return SuccessfulResponse();
        case StatusCodes.alreadyTaken:
          return ErrorModel.fromJson(response.body);
        default:
          throw ErrorModel.fromJson(response.body);
      }
    } catch (e) {
      return ResponseError.noInternet;
    }
  }
}
