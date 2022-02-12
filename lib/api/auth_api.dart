import 'dart:developer';

import 'package:cmu_mobile_app/models/sign_up_model.dart';
import 'package:cmu_mobile_app/models/user_auth_model.dart';
import 'package:cmu_mobile_app/services/http/http_request.dart';
import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:cmu_mobile_app/services/shared_preferences/shared_pref.dart';
import 'package:cmu_mobile_app/utils/constants.dart';

class AuthApi {
  static Future<UserAuthModel> signIn({required LoginParameter param}) async {
    String url = '$baseUrl/login';
    Map<String, dynamic> response = await HttpRequest.post(url, data: param);
    await SharedPref.setStringPref(
        key: "token", value: response["token"].toString());
    UserAuthModel user = UserAuthModel.fromJson(response["user"]);
    return user;
  }

  static Future<UserAuthModel> signUp({required SignUpModel param}) async {
    String url = '$baseUrl/register';
    Map<String, dynamic> response = await HttpRequest.post(url, data: param);
    await SharedPref.setStringPref(
        key: "token", value: response["token"].toString());
    UserAuthModel user = UserAuthModel.fromJson(response["user"]);
    log(user.toJson().toString());
    return user;
  }

  static Future<List<UserAuthModel>> getStudents() async {
    String url = '$baseUrl/students';
    List<dynamic> response = await HttpRequest.get(url, withAccessToken: true);
    List<UserAuthModel> studentList =
        response.map((e) => UserAuthModel.fromJson(e)).toList();
    return studentList;
  }
}
