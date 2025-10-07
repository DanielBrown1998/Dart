part of '../services.dart';

class BytebankBalanceService {
  static const String port = "3002";
  static String url = "${Url.url}:$port";
  static Future<bool> hasPin({required String id}) async {
    http.Response response = await http.post(
      Uri.parse("$url/has-pin"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"userId": id}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)["hasPin"];
    } else {
      return json.decode(response.body)["erro"];
    }
  }

  static Future<dynamic> createPin({
    required String id,
    required String newPin,
  }) async {
    http.Response response = await http.post(
      Uri.parse("$url/create-pin"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"userId": id, "newPin": newPin}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)["balance"];
    } else {
      return json.decode(response.body)["erro"];
    }
  }

  static Future<dynamic> getBalance({
    required String id,
    required String pin,
  }) async {
    http.Response response = await http.post(
      Uri.parse("$url/balance"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"userId": id, "pin": pin}),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)["balance"];
    } else {
      return json.decode(response.body)["erro"];
    }
  }
}
