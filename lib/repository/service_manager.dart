import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

enum HttpMethodType { GET, POST, DELETE }

class Servicemanager {
  static const baseUrl = "https://www.superheroapi.com/api.php/3052170831694596";

  Future<Map<String, String>> getHeaders() async {
    return {"Accept": "*/*", 'Content-Type': 'application/json'};
  }

  Future<Response> callService(
      {required HttpMethodType type,
      required String url,
      Map<String, dynamic>? body}) async {
    String? reqBody;
    String urlCall = baseUrl + url;
    print("REQUEST");
    print(urlCall);
    final headers = await getHeaders();
    if (body != null) {
      reqBody = json.encode(body);
      print(reqBody);
    }
    switch (type) {
      case HttpMethodType.GET:
        final result = await http.get(Uri.parse(urlCall), headers: headers);
        logResponse(result);
        return result;
      case HttpMethodType.POST:
        final result = await http.post(Uri.parse(urlCall), headers: headers, body: reqBody);
        logResponse(result);
        return result;
      case HttpMethodType.DELETE:
        final result = await http.delete(Uri.parse(urlCall), headers: headers, body: reqBody);
        logResponse(result);
        return result;
    }
  }

  logResponse(Response result) {
    print("Status code response = " + result.statusCode.toString());
    print(result.body);
  }
}
