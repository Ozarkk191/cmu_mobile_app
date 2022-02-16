import 'package:cmu_mobile_app/models/questions/question2_model.dart';
import 'package:cmu_mobile_app/models/questions/question3_model.dart';
import 'package:cmu_mobile_app/services/http/http_request.dart';
import 'package:cmu_mobile_app/utils/constants.dart';

class QuestionApi {
  static Future<Map<String, dynamic>> setQuestion2(
      {required Question2Model param}) async {
    String url = '$baseUrl/question2';
    final response = await HttpRequest.post(
      url,
      data: param,
      withAccessToken: true,
    );
    return response;
  }

  static Future<Map<String, dynamic>> setQuestion3(
      {required Question3Model param}) async {
    String url = '$baseUrl/question3';
    final response = await HttpRequest.post(
      url,
      data: param,
      withAccessToken: true,
    );
    return response;
  }
}
