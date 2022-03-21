import 'dart:convert';
import 'dart:developer';

import 'package:cmu_mobile_app/models/all_user_model.dart';
import 'package:cmu_mobile_app/models/profile_model.dart';
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

    log(jsonEncode(response["user"]));
    UserAuthModel user = UserAuthModel.fromJson(response["user"]);
    return user;
  }

  static Future<List<UserAuthModel>> getStudents() async {
    String url = '$baseUrl/students';
    List<UserAuthModel> studentList = [];
    final response = await HttpRequest.get(url);
    if (response.isNotEmpty) {
      response.map((i) => studentList.add(UserAuthModel.fromJson(i))).toList();
    }
    return studentList;
  }

  static Future<AllUserModel> getAllUser() async {
    String url = '$baseUrl/users/all';

    final response = await HttpRequest.get(url, withAccessToken: true);
    AllUserModel allUser = AllUserModel.fromJson(response);
    // if (response.isNotEmpty) {
    //   response.map((i) => studentList.add(UserAuthModel.fromJson(i))).toList();
    // }
    return allUser;
  }

  static Future<Map<String, dynamic>> setProflieData(
      {required ProfileModel param}) async {
    String url = '$baseUrl/profile';
    final response = await HttpRequest.post(
      url,
      data: param,
      withAccessToken: true,
    );
    return response;
  }

  static Future<Map<String, dynamic>> deleteUser({
    required String userID,
  }) async {
    String url = '$baseUrl/users/$userID';
    final response = await HttpRequest.delete(
      url,
      withAccessToken: true,
    );
    return response;
  }

  static Future<User> getChildren(
      {required RequestBodyParameters param}) async {
    String url = '$baseUrl/parents/children';
    final response = await HttpRequest.get(
      url,
      queryParameters: param,
      withAccessToken: true,
    );
    User user = User.fromJson(response);
    return user;
  }

  static Future<Map<String, dynamic>> updatePassword(
      {required RequestBodyParameters param}) async {
    String url = '$baseUrl/users/change';
    final response = await HttpRequest.patch(
      url,
      data: param,
      withAccessToken: true,
    );
    return response;
  }
}
