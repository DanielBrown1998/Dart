part of '../services.dart';

class BytebankAuthService {
  static const String port = "3001";
  static String url = "${Url.url}:$port";
  static Future<dynamic> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    http.Response response = await http.post(
      Uri.parse("$url/signup"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email, "password": password, "name": name}),
    );
    if (response.statusCode.toString().startsWith('2')) {
      return json.decode(response.body)["mensagem"];
    } else {
      return json.decode(response.body)["erro"];
    }
  }

  static Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    http.Response response = await http.post(
      Uri.parse("$url/login"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email, "password": password}),
    );
    if (response.statusCode.toString().startsWith('2')) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body)["erro"];
    }
  }

  static Future<dynamic> findId({required String userId}) async {
    http.Response response = await http.get(
      Uri.parse("$url/find-id/$userId"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode.toString().startsWith('2')) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body)["erro"];
    }
  }

  static Future<dynamic> findEmail({required String email}) async {
    http.Response response = await http.get(
      Uri.parse("$url/find-email/$email"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode.toString().startsWith('2')) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body)["erro"];
    }
  }
}
