import 'dart:developer';
import 'dart:io';

import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpRequest {
  static Dio dio = Dio();

  static Future<String?> _getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    return token;
  }

  static Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<dynamic> get(
    String path, {
    RequestBodyParameters? queryParameters,
    bool withAccessToken = false,
  }) async {
    Response<dynamic> response;
    final headers = await _buildHeaders(withAccessToken: withAccessToken);
    try {
      response = await dio.get(path, options: Options(headers: headers));
    } on SocketException {
      throw ('No Internet connection.');
    }

    return response.data;
  }

  static Future<Map<String, dynamic>> post(
    String path, {
    RequestBodyParameters? data,
    bool withAccessToken = false,
  }) async {
    Response<dynamic> response;

    final headers = await _buildHeaders(
      withAccessToken: withAccessToken,
      withContentType: true,
    );

    try {
      response = await dio.post(
        path,
        queryParameters: data!.toJson(),
        options: Options(headers: headers),
      );
      log("status ==> " + response.statusCode.toString());
    } on SocketException catch (_) {
      throw ('No Internet connection.');
    }
    return response.data;
  }

  static Future<Map<String, String>> _buildHeaders(
      {bool withAccessToken = false, bool withContentType = false}) async {
    final Map<String, String> headers = {'Accept': 'application/json'};
    if (withContentType) {
      headers.putIfAbsent('Content-Type', () => 'application/json');
    }
    if (withAccessToken) {
      String? accessToken = await _getPrefs();
      if (accessToken != null) {
        headers.putIfAbsent('Authorization', () => 'Bearer ' + accessToken);
        // log('Authorization: Bearer ' + accessToken);
      }
    }
    return headers;
  }
}
