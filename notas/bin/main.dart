//coleções
enum Nomes {
  Daniel,
  Rafael,
  Dayse,
  Marcelo,
  Rafaela,
}

void main() {
  //List<dynamic> listas = [];
  var listas = <dynamic>[];
  Nomes.values.forEach((Nomes value) {
    listas.add(value);
  });
}
