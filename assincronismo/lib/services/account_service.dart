import 'dart:async';
import 'dart:convert';
import 'package:assincronismo/api_key.dart' as key;
import 'package:assincronismo/models/account.dart';

import 'package:http/http.dart' as http;

class AccountService {
  final StreamController<String> _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;
  String url = 'https://api.github.com/gists/2e08120282bc3f5c4160b6ba56b2cef1';
  String gist =
      "https://gist.githubusercontent.com/DanielBrown1998/2e08120282bc3f5c4160b6ba56b2cef1/raw/528d5e9dcafd230b537d7ef48dd1f35da638aa5a/accounts.json";

  Future<List<Account>> getAll() async {
    http.Response response = await http.get(Uri.parse(url));
    _streamController.add("${DateTime.now()} -  Requisição de leitura");
    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> file =
        json.decode(mapResponse['files']['accounts.json']['content']);
    List<Account> accounts = [];
    for (Map<String, dynamic> item in file) {
      accounts.add(Account.fromMap(item));
    }
    return accounts;
  }

  addAccount({required Account account}) async {
    List<Account> file = await getAll();

    file.add(account);

    List<Map<String, dynamic>> listContent = [];
    for (Account item in file) {
      listContent.add(item.toMap());
    }

    http.Response response = await http.post(Uri.parse(url),
        body: json.encode({
          'description': 'Accounts.json',
          'public': true,
          'files': {
            'accounts.json': {
              'content': json.encode(listContent),
            }
          }
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${key.githubApiKey}',
        });
    if (response.statusCode.toString().startsWith('2')) {
      _streamController.add(
          "${DateTime.now()} -  Requisição de escrita do dado ${account.name} realizada com sucesso");
    } else {
      _streamController.add(
          "${DateTime.now()} -  Requisição de escrita do dado ${account.name} falhou");
    }
  }

  getAccountById({required String id}) {
    getAll().then((listAccount) {
      for (Account account in listAccount) {
        if (account.id == id) {
          return account;
        }
      }
      return null;
    });
  }

  updateAccount(Account account) async {
    List<Map<String, dynamic>> listContent = [];

    getAll().then((listAccount) {
      for (Account item in listAccount) {
        if (item.id == account.id) {
          item = account;
        }
        listContent.add(item.toMap());
      }
    });

    http.Response response = await http.post(Uri.parse(url),
        body: json.encode({
          'description': 'Accounts.json',
          'public': true,
          'files': {
            'accounts.json': {
              'content': json.encode(listContent),
            }
          }
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${key.githubApiKey}',
        });
    if (response.statusCode.toString().startsWith('2')) {
      _streamController.add(
          "${DateTime.now()} -  Requisição de atualização do dado ${account.name} realizada com sucesso");
    } else {
      _streamController.add(
          "${DateTime.now()} -  Requisição de atualização do dado ${account.name} falhou");
    }
  }

  deleteAccount({required String id}) async {
    List<Map<String, dynamic>> listContent = [];

    bool removed = false;

    getAll().then((listAccount) {
      for (Account item in listAccount) {
        if (item.id != id) {
          listContent.add(item.toMap());
        }else{
          removed = true;
        }
      }
    });

    if(!removed){
      return _streamController.add(
          "${DateTime.now()} -  $id não encontrado");
    }

    http.Response response = await http.post(Uri.parse(url),
        body: json.encode({
          'description': 'Accounts.json',
          'public': true,
          'files': {
            'accounts.json': {
              'content': json.encode(listContent),
            }
          }
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${key.githubApiKey}',
        });
    if (response.statusCode.toString().startsWith('2')) {
      _streamController.add(
          "${DateTime.now()} -  Requisição de exclusão do dado ${id} realizada com sucesso");
    } else {
      _streamController.add(
          "${DateTime.now()} -  Requisição de exclusão do dado ${id} falhou");
    }
  }
}


