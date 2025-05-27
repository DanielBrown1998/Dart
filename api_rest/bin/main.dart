import "dart:async";
import "dart:convert";

import "package:api_rest/models/accounts.dart";
import "package:http/http.dart" as http;
import "package:api_rest/url.dart" as url;
import "package:api_rest/token.dart" as token;

StreamController streamController = StreamController();

void main(List<String> arguments) async {
  StreamSubscription subscription = streamController.stream.listen(
    (event) => print(event),
  );

  requestData();
  sendData({
    "id": "NEW002",
    "name": "Carlos",
    "lastName": "Drumond de Andrade",
    "balance": 5120.0,
  });

}

Future<List<dynamic>> getVideos() async {
  http.Response response = await http.get(
    Uri.parse(url.url),
    headers: {"Authorization": "Bearer ${token.tokenGist}"},
  );
  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> videos = json.decode(map["files"]["playlist.json"]["content"]);

  return videos;
}

Future<List<Accounts>> requestData() async {
  List<Accounts> accounts = [];
  http.Response response = await http.get(
    Uri.parse(url.urlGistReadWrite),
    headers: {"Authorization": "Bearer ${token.tokenGist}"},
  );
  List<dynamic> map = json.decode(
    json.decode(response.body)["files"]["accounts.json"]["content"],
  );
  for (dynamic item in map) {
    accounts.add(Accounts.fromMap(item));
    streamController.add(
      "${Accounts.fromMap(item).toString()} | ${DateTime.now()}",
    );
  }
  return accounts;
}

Future<List?> sendData(Map<String, dynamic> mapAccount) async {
  List<Accounts> accounts = await requestData();
  Accounts acc = Accounts.fromMap(mapAccount);
  accounts.add(acc);

  http.Response response = await http.post(
    Uri.parse(url.urlGistReadWrite),
    headers: {
      "Authorization": "Bearer ${token.tokenGist}",
      "Content-Type": "application/json",
    },
    encoding: Encoding.getByName("utf-8"),
    body: json.encode({
      "description": "atualizando gists",
      "public": true,
      "files": {
        "accounts.json": {
          "content": json.encode(accounts.map((e) => e.toMap()).toList()),
        },
      },
    }),
  );
  if (response.statusCode.toString().startsWith("2")) {
    String content =
        json.decode(response.body)["files"]["accounts.json"]["content"];
    List<dynamic> map = json.decode(content);
    for (dynamic item in map) {
      streamController.add(
        "${Accounts.fromMap(item).toString()} | ${DateTime.now()}",
      );
    }
    return map;
  } else {
    streamController.add("Requisicao falhou | ${DateTime.now()}");
  }
  return null;
}

pickupBooks({required String author}) async {
  http.Response response = await http.get(
    Uri.parse(
      "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/books.json",
    ),
  );
  List<dynamic> map = json.decode(response.body);
  for (dynamic item in map) {
    if (item["author"]!.toString().trim() == author.trim()) {
      print(item["title"]);
    }
  }
}
