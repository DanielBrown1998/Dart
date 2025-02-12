import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  requestData();
  // requestReceitas();
}

Future<void> requestData() async {
  String url =
      "https://gist.githubusercontent.com/DanielBrown1998/2e08120282bc3f5c4160b6ba56b2cef1/raw/528d5e9dcafd230b537d7ef48dd1f35da638aa5a/accounts.json";
  http.Response response = await http.get(Uri.parse(url));
  print(response.request?.method);
  print(response.statusCode);
  List<dynamic> file = json.decode(response.body);
  for (Map<String, dynamic> item in file) {
    print(item);
  }
}

Future<void> requestReceitas() async {
  String url =
      "https://gist.githubusercontent.com/DanielBrown1998/5d98898604a333c1e34199b158d26776/raw/b7cfc78cfa525fc2930526e22c0e2d2c58637c7b/receitas.json";
  var response = await http.get(Uri.parse(url));
  for (Map<String, dynamic> item in json.decode(response.body)) {
    item.forEach(
      (String key, dynamic value) {
        print("$key: $value");
      },
    );
    print("-------------------------------------");
  }
}
