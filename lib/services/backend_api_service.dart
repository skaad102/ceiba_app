import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class BackendApiService {
  static const Duration timeoutTime = Duration(seconds: 15);
  final jsonContentHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  String backendServer = 'https://jsonplaceholder.typicode.com/';

  Future<dynamic> get(
    String path, {
    Map<String, String>? queryParameters,
    Map<String, String> headers = const <String, String>{},
    bool authenticated = true,
  }) async {
    final uri = Uri.http(backendServer, path, queryParameters);
    final response = await http
        .get(
          uri,
          headers: headers,
        )
        .timeout(timeoutTime);

    if (response.statusCode > 399) {
      throw HttpException("invalid server status code: ${response.statusCode}");
    }
    if (response.body.isEmpty) {
      return {};
    }
    try {
      final responseBody = jsonDecode(response.body);
      return responseBody;
    } on FormatException {
      return {};
    }
  }
}
