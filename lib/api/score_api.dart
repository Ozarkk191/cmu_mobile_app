import '../services/http/http_request.dart';
import '../utils/constants.dart';

class ScoreApi {
  static Future<Map<String, dynamic>> getScore({required String path}) async {
    String url = '$baseUrl/$path';
    final response = await HttpRequest.get(
      url,
      withAccessToken: true,
    );
    return response;
  }
}
