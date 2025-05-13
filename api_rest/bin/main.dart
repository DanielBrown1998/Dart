import "dart:convert";

import "package:api_rest/models/accounts.dart";
import "package:http/http.dart" as http;
import "package:api_rest/url.dart" as url;

void main(List<String> arguments) {
  requestData();
}

requestData() async {
  http.Response response = await http.get(Uri.parse(url.url));
  List<dynamic> map = json.decode(response.body);
  for (dynamic item in map) {
    print(Accounts.fromMap(item).toString());
  }
}
