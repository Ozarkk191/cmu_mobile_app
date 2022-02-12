import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cmu_mobile_app/models/body_parameters.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'exception/exception.dart';

class MainService {
  final _host = 'https://nurseapi.herokuapp.com/public/api';
  // final _contextRoot = 'public/api';

//=============================GET=======================================
  Future<dynamic> get(
    String path, {
    Map<String, String>? queryParameters,
    bool withAccessToken = false,
  }) async {
    final uri = Uri.https(_host, '/$path', queryParameters);
    // print('haircut ${uri.toString()}');
    dynamic responseJson;
    final headers = await _buildHeaders(withAccessToken: withAccessToken);
    try {
      final response = await http.get(uri, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(null, 'No Internet connection.');
    }
    return responseJson;
  }

//=============================POST=======================================
  Future<dynamic> post(
    String path, {
    RequestBodyParameters? data,
    bool withAccessToken = false,
  }) async {
    final uri = Uri.https(_host, '/$path');
    // print(uri.toString());
    // print(json.encode(data));
    dynamic responseJson;
    final headers = await _buildHeaders(
        withAccessToken: withAccessToken, withContentType: true);
    // print('header :: $headers');
    try {
      final response = await http.post(uri,
          headers: headers,
          body: data != null ? json.encode(data.toJson()) : null);
      // print('response :: $response');
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(null, 'No Internet connection.');
    }
    return responseJson;
  }

//=============================PUT=======================================
  Future<dynamic> put(
    String path, {
    RequestBodyParameters? data,
    bool withAccessToken = false,
  }) async {
    final uri = Uri.https(_host, '/$path');
    // print(uri.toString());
    // print(json.encode(data));
    dynamic responseJson;
    final headers = await _buildHeaders(
        withAccessToken: withAccessToken, withContentType: true);
    try {
      // print(json.encode(data.toJson()));
      final response = await http.put(uri,
          headers: headers,
          body: data != null ? json.encode(data.toJson()) : null);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(null, 'No Internet connection.');
    }
    return responseJson;
  }

//=============================DELETE=======================================
  Future<dynamic> delete(
    String path, {
    RequestBodyParameters? data,
    bool withAccessToken = false,
  }) async {
    final uri = Uri.https(_host, '/$path');
    // print(uri.toString());
    dynamic responseJson;
    final headers = await _buildHeaders(
        withAccessToken: withAccessToken, withContentType: true);
    try {
      final response = await http.delete(uri, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException(null, 'No Internet connection.');
    }
    return responseJson;
  }

  Future<Map<String, String>> _buildHeaders({
    bool withAccessToken = false,
    bool withContentType = false,
  }) async {
    final Map<String, String> headers = {'Accept': 'application/json'};
    if (withContentType) {
      headers.putIfAbsent('Content-Type', () => 'application/json');
    }
    if (withAccessToken) {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      String? accessToken = await storage.read(key: 'accessToken');
      if (accessToken != null) {
        headers.putIfAbsent('Authorization', () => 'Bearer ' + accessToken);
        log('Authorization: Bearer ' + accessToken);
      }
    }
    return headers;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(400, _getErrorMessage(response.body));
      case 401:
      case 403:
        throw UnauthorisedException(401, _getErrorMessage(response.body));
      case 500:
      default:
        throw FetchDataException(null,
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  String _getErrorMessage(String jsonString) {
    final obj = json.decode(jsonString);
    final message = obj['message'];
    return message ?? 'An error occurred.';
  }
}
