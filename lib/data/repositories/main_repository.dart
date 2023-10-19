import 'dart:convert';
import 'dart:io';

import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/data/models/auth_models/create_account_model.dart';
import 'package:kids_edu_teacher/data/models/auth_models/vaerification_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/get_user_model.dart';
import 'package:kids_edu_teacher/data/models/video_models/get_all_collections_model.dart';
import 'package:kids_edu_teacher/data/responses/error_response.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';
import 'package:http/http.dart' as http;
import 'package:kids_edu_teacher/data/responses/status_codes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainRepository {
  MainRepository._();

  static Future<ResponseData> createAccount(
      String name, String psw, String phone, String dtf) async {
    try {
      final response =
          await http.post(Uri.parse('${ApiPaths.basicUrl}/teachers'),
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
    } catch (e) {
      return ResponseError.noInternet;
    }
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
      final response =
          await http.post(Uri.parse('${ApiPaths.basicUrl}/teachers/login'),
              headers: {'Content-Type': 'application/json'},
              body: json.encode(
                {
                  "phoneNumber": "998$phone".replaceAll("-", ""),
                  "password": psw
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

  static Future<ResponseData> getVideoCollections() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiPaths.basicUrl}/teachers/video-collections'),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
      switch (response.statusCode) {
        case StatusCodes.ok:
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

  static Future<ResponseData> getDocumentCollections() async {
    // try {
    final response = await http.get(
      Uri.parse('${ApiPaths.basicUrl}/teachers/document-collections'),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.body);
    switch (response.statusCode) {
      case StatusCodes.ok:
        return VideoCollectionsModel.fromJson(response.body);
      case StatusCodes.alreadyTaken:
        return ErrorModel.fromJson(response.body);
      default:
        throw ErrorModel.fromJson(response.body);
    }
    // } catch (e) {
    //   return ResponseError.noInternet;
    // }
  }

  static Future<ResponseData> getUserData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var userId = _prefs.getString('userId');
    String fileName = "userDataCache.json";
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
}
