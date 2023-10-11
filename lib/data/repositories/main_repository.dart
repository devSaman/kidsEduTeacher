import 'dart:convert';

import 'package:kids_edu_teacher/constants/api_path.dart';
import 'package:kids_edu_teacher/data/models/auth_models/create_account_model.dart';
import 'package:kids_edu_teacher/data/models/common_models/error_model.dart';
import 'package:kids_edu_teacher/data/responses/error_response.dart';
import 'package:kids_edu_teacher/data/responses/response_data.dart';
import 'package:http/http.dart' as http;
import 'package:kids_edu_teacher/data/responses/status_codes.dart';

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
}
