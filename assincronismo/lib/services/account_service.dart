import 'dart:async';
import 'dart:convert';
import 'package:assincronismo/api_key.dart' as key;

import 'package:http/http.dart' as http;

class AccountService {
  final StreamController<String> _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;
  String url = 'https://api.github.com/gists/2e08120282bc3f5c4160b6ba56b2cef1';
  String gist =
      "https://gist.githubusercontent.com/DanielBrown1998/2e08120282bc3f5c4160b6ba56b2cef1/raw/528d5e9dcafd230b537d7ef48dd1f35da638aa5a/accounts.json";

  Future<List<dynamic>> getAll() async {
    http.Response response = await http.get(Uri.parse(url));
      _streamController.add(
          "${DateTime.now()} -  Requisição de leitura");
    return json.decode(response.body);
  }

  addAccount({Map<String, dynamic>? mapAccount}) async {
    mapAccount ??= {
      "id": "NewID001",
      "name": "NewName",
      "lastName": "NewLastName",
      "balance": 0.0,
    };

    List<dynamic> file = await getAll();

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
      _streamController.add(
          "${DateTime.now()} -  Requisição de escrita do dado ${mapAccount['id']} realizada com sucesso");
    } else {
      _streamController.add(
          "${DateTime.now()} -  Requisição de escrita do dado ${mapAccount['id']} falhou");
    }
  }
}
