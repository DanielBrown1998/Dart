import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:assincronismo/api_key.dart' as key;

StreamController<String> streamController = StreamController<String>();

void main() async {
  StreamSubscription subscription = streamController.stream.listen(
    (String data) {
      print(data);
    },
  );

  requestData();
  sendData();
}

requestData() async {
  String url =
      "https://gist.githubusercontent.com/DanielBrown1998/2e08120282bc3f5c4160b6ba56b2cef1/raw/528d5e9dcafd230b537d7ef48dd1f35da638aa5a/accounts.json";
  http.Response response = await http.get(Uri.parse(url));
  List<dynamic> file = json.decode(response.body);
  for (Map<String, dynamic> item in file) {
    streamController.add("${DateTime.now()} -  Requisição de leitura do dado ${item['id']}");
  }
}

sendData({Map<String, dynamic>? mapAccount}) async {
  String url = 'https://api.github.com/gists/2e08120282bc3f5c4160b6ba56b2cef1';

  mapAccount ??= {
    "id": "NewID001",
    "name": "NewName",
    "lastName": "NewLastName",
    "balance": 0.0,
  };

  String gist =
      "https://gist.githubusercontent.com/DanielBrown1998/2e08120282bc3f5c4160b6ba56b2cef1/raw/528d5e9dcafd230b537d7ef48dd1f35da638aa5a/accounts.json";
  http.Response responseGet = await http.get(Uri.parse(gist));
  print("GET: ${responseGet.request?.method}");
  print("GIST STATUS: ${responseGet.statusCode}");
  List<dynamic> file = json.decode(responseGet.body);

  file.add(mapAccount);
  http.Response response = await http.post(Uri.parse(url),
      body: json.encode({
        'description': 'Accounts.json',
        'public': true,
        'files': {
          'accounts.json': {
            'content': json.encode(file),
          }
        }
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${key.githubApiKey}',
      });
  if (response.statusCode.toString().startsWith('2')) {
    streamController.add("${DateTime.now()} -  Requisição de escrita do dado ${mapAccount['id']} realizada com sucesso");
  }else{
    streamController.add("${DateTime.now()} -  Requisição de escrita do dado ${mapAccount['id']} falhou");

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
