import 'dart:developer';

import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:cmu_mobile_app/services/http/http_request.dart';
import 'package:cmu_mobile_app/utils/constants.dart';

class QuestionApi {
  static Future<Map<String, dynamic>> setQuestion({
    required RequestBodyParameters param,
    required String path,
  }) async {
    String url = '$baseUrl/$path';
    log(url);
    final response = await HttpRequest.post(
      url,
      data: param,
      withAccessToken: true,
    );
    return response;
  }

  static Future<Map<String, dynamic>> getEvent() async {
    String url = '$baseUrl/start';
    final response = await HttpRequest.get(
      url,
      withAccessToken: true,
    );
    return response;
  }

  static Future<Map<String, dynamic>> setEvent() async {
    String url = '$baseUrl/start';
    final response = await HttpRequest.post(
      url,
      withAccessToken: true,
    );
    return response;
  }
}
