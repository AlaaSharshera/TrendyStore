import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> getService({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unexpected status code ${response.statusCode}');
    }
  }

  Future<dynamic> potService(
      {required String url, required Map<String, dynamic> body}) async {
    http.Response response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unexpected status code ${response.statusCode}');
    }
  }

  Future<dynamic> putService(
      {required String url, required Map<String, dynamic> body}) async {
    http.Response response = await http.put(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unexpected status code ${response.statusCode}');
    }
  }
}
