void enviarEmail({required String from, required Map<String, String> to}) {
  print(from);
  for (String value in to.values) {
    print("enviando para: $value");
    print("enviado");
  }
}

void main() {
  Map<String, String> emails = {
    "daniel": "daniel_x@xpto.com",
    "brown": "daniel@outlook.com",
    "daniel brown": "daniel@gmail.com",
  };

  String email = "daniel@hotmail.com";
  emails["daniel brown rodrigues"] = email;
  emails.forEach((String key, String value) {
    if (value == email) {
      print("$key esta no conjunto");
    }
  });
  enviarEmail(from: "daniel_mingozzi@hotmail.com", to: emails);
}
